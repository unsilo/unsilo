use Mix.Config

config :unsilo_web, UnsiloWeb.Endpoint,
  url: [host: "localhost", port: 82],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :unsilo_web, UnsiloWeb.Endpoint, server: true

import_config "prod.secret.exs"
