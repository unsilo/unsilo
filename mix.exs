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
        strip_beams: Mix.env() == :prod,
        version: {:from_app, :unsilo_web}
      ],
      unsilo_rpi4: [
        applications: [firmware_rpi4: :permanent],
        version: {:from_app, :firmware_rpi4},
        overwrite: true,
        cookie: "firmware_rpi4_cookie",
        include_erts: &Nerves.Release.erts/0,
        steps: [&Nerves.Release.init/1, :assemble],
        strip_beams: Mix.env() == :prod
      ]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false}
    ]
  end
end
