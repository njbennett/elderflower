defmodule S83Server.MixProject do
  use Mix.Project

  def project do
    [
      app: :elderflower,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {S83Server.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:httpoison, "~> 1.8"}
    ]
  end
end
