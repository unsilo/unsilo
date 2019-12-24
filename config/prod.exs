use Mix.Config

config :unsilo_web, UnsiloWeb.Endpoint,
  http: [port: 80],
  url: [host: "chomp.local", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: "chomp.local",
  server: true

config :logger, level: :info

import_config "prod.secret.exs"
