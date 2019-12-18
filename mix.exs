defmodule Unsilo.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  defp releases do
    [
        unsilo: [
          applications: [unsilo: :permanent, unsilo_web: :permanent],
          version: {:from_app, :unsilo_web}
        ],
        unsilo_rpi4: [
          applications: [firmware_rpi4: :permanent, unsilo: :permanent, unsilo_web: :permanent],
          version: {:from_app, :firmware_rpi4}
        ]
      ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    []
  end
end
