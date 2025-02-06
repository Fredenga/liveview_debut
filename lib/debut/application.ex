defmodule Debut.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DebutWeb.Telemetry,
      Debut.Repo,
      {DNSCluster, query: Application.get_env(:debut, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Debut.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Debut.Finch},
      # Start a worker by calling: Debut.Worker.start_link(arg)
      # {Debut.Worker, arg},
      # Start to serve requests, typically the last entry
      DebutWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Debut.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DebutWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
