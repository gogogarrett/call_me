# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :call_me_web,
  ecto_repos: [CallMeWeb.Repo]

# Configures the endpoint
config :call_me_web, CallMeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gEVa2C+oEpLKXC3dLVacNSSP3h9lhRviV8QSSEQhVBmatiyqEppNZMqvAvU2SrxI",
  render_errors: [view: CallMeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CallMeWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
