defmodule FlatpickrPhxLiveview.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false

  alias FlatpickrPhxLiveview.Users.User

  def list_users(params) do
    params = build_params(params)

    from(u in User)
    |> Flop.validate_and_run!(params, for: User)
  end

  defp build_params(params) when map_size(params) == 0 do
    yesterday = Date.add(Date.utc_today(), -1) |> to_string()
    today = to_string(Date.utc_today())

    %{
      "filters" =>
        %{inserted_at_date: [yesterday, today]}
        |> Flop.Filter.new(operators: %{inserted_at_date: :in})
        |> Enum.map(&Map.from_struct/1)
    }
  end

  defp build_params(params), do: params
end
