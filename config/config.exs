# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :block_api,
  ecto_repos: [BlockApi.Repo],
  block_max_rows: 5

# Configures the endpoint
config :block_api, BlockApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yPMGly72+yWi7ZkLSUttHw18YAs9lbbr8ye8w/u2VNnMYDTKd/u3ROeIidaYXPq7",
  render_errors: [view: BlockApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: BlockApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
