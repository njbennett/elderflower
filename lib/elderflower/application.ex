defmodule Elderflower.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElderflowerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elderflower.PubSub},
      # Start the Endpoint (http/https)
      ElderflowerWeb.Endpoint
      # Start a worker by calling: Elderflower.Worker.start_link(arg)
      # {Elderflower.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elderflower.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElderflowerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end