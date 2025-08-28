defmodule Link42.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Link42Web.Telemetry,
      # Link42.Repo, # Comentado para executar sem banco de dados
      {DNSCluster, query: Application.get_env(:link42, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Link42.PubSub},
      # Start a worker by calling: Link42.Worker.start_link(arg)
      # {Link42.Worker, arg},
      # Start to serve requests, typically the last entry
      Link42Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Link42.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Link42Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
