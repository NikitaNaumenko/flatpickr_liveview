defmodule FlatpickrPhxLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FlatpickrPhxLiveviewWeb.Telemetry,
      FlatpickrPhxLiveview.Repo,
      {DNSCluster, query: Application.get_env(:flatpickr_phx_liveview, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FlatpickrPhxLiveview.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FlatpickrPhxLiveview.Finch},
      # Start a worker by calling: FlatpickrPhxLiveview.Worker.start_link(arg)
      # {FlatpickrPhxLiveview.Worker, arg},
      # Start to serve requests, typically the last entry
      FlatpickrPhxLiveviewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FlatpickrPhxLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FlatpickrPhxLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
