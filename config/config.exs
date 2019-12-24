use Mix.Config

# Configure Mix tasks and generators
# config :unsilo,
#  ecto_repos: [Unsilo.Repo]

# config :unsilo_web,
#  ecto_repos: [Unsilo.Repo],
#  generators: [context_app: :unsilo]

# Configures the endpoint
config :unsilo_web, UnsiloWeb.Endpoint,
  secret_key_base: "+XVrdgHGScHYg8abqmQNBrLQfN267AbZItprx3+dNyQiMU8qJ8Rya2VHzL1NnDNQ",
  render_errors: [view: UnsiloWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UnsiloWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mdns_lite,
  host: :chomp,
  ttl: 120,
  services: [
    # service type: _http._tcp.local - used in match
    %{
      name: "Web Server",
      protocol: "http",
      transport: "tcp",
      port: 80
    },
    # service_type: _ssh._tcp.local - used in match
    %{
      name: "Secure Socket",
      protocol: "ssh",
      transport: "tcp",
      port: 22
    },
    %{
      name: "SSH Remote Login Protocol",
      protocol: "ssh",
      transport: "tcp",
      port: 22
    },
    %{
      name: "Secure File Transfer Protocol over SSH",
      protocol: "sftp-ssh",
      transport: "tcp",
      port: 22
    },
    %{
      name: "Erlang Port Mapper Daemon",
      protocol: "epmd",
      transport: "tcp",
      port: 4369
    }
  ]

import_config "#{Mix.env()}.exs"

if Mix.target() != :host do
  import_config "target.exs"
else
  import_config "host.exs"
end
