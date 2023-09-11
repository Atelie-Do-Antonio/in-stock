# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :coretto,
  ecto_repos: [Coretto.Repo]

# Configures the endpoint
config :coretto, CorettoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K6ffKHld7jPCXjdUoxDkohI1z2sm+WX8AnnsLXdz459E9QEYMMu3ViUcUseCsLl1",
  render_errors: [view: CorettoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Coretto.PubSub,
  live_view: [signing_salt: "Nm8GZYN0"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
