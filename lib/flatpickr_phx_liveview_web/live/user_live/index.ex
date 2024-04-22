defmodule FlatpickrPhxLiveviewWeb.UserLive.Index do
  use FlatpickrPhxLiveviewWeb, :live_view

  alias FlatpickrPhxLiveview.Users
  alias FlatpickrPhxLiveview.Users.User

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def handle_params(params, _url, socket) do
    {users, flop_meta} = Users.list_users(params)

    socket =
      socket
      |> assign(:meta, flop_meta)
      |> assign(:form, to_form(flop_meta))
      |> stream(:users, users, reset: true)
      |> assign_default_dates(params)

    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("update-filter", params, socket) do
    params = Map.delete(params, "_target")
    params = prepare_params(params)

    socket =
      case Flop.Filter.get_value(params["filters"], :inserted_at_date) do
        [_start_date, _end_date] ->
          push_patch(socket, to: ~p"/users?#{params}")

        _ ->
          socket
      end

    {:noreply, socket}
  end

  defp prepare_params(%{"filters" => filters} = params) do
    filters =
      Flop.Filter.update_value(filters, :inserted_at_date, fn
        "" ->
          nil

        date ->
          case String.split(date, " ") do
            [start_date, _sep, end_date] -> [start_date, end_date]
            date -> date
          end
      end)

    %{params | "filters" => filters}
  end

  defp assign_default_dates(socket, %{"filters" => filters}) do
    case Flop.Filter.get_value(filters, :inserted_at_date) do
      [start_date, end_date] ->
        assign(socket, :default_dates, [start_date, end_date])

      _ ->
        socket
    end
  end

  defp assign_default_dates(socket, _) do
    yesterday = Date.add(Date.utc_today(), -1) |> to_string()
    today = to_string(Date.utc_today())

    assign(socket, :default_dates, [yesterday, today])
  end
end
