defmodule PreviewServer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :glayu_preview_server,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.4",
      aliases: [test: "test --no-start"],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      applications: [:logger, :yamerl, :eex, :cowboy, :plug, :glayu_core, :glayu_build],
      mod: {Glayu.PreviewServer, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:my_app, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:glayu_build, in_umbrella: true},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:file_system, git: "https://github.com/falood/file_system.git"}
    ]
  end
end
