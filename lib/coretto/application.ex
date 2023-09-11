defmodule Coretto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Coretto.Repo,
      # Start the Telemetry supervisor
      CorettoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Coretto.PubSub},
      # Start the Endpoint (http/https)
      CorettoWeb.Endpoint
      # Start a worker by calling: Coretto.Worker.start_link(arg)
      # {Coretto.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Coretto.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CorettoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
