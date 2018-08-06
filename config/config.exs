# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :quest,
  ecto_repos: [Quest.Repo]

# Configures the endpoint
config :quest, QuestWeb.Endpoint,
  url: [host: "localhost"],
#  secret_key_base: "G9Nme5lKqBzzDcNrJwEhQoWT8W/H/J27wzAr1y8YpQZ1o6kT/qnwwbw4f0J9+6a5",
  secret_key_base: "663f276fb611224cedbd530e648e9a202a93d0ef5cdf97193fc6981395c05bede0f29df8df89b43cfabe595425587a9dbb881513458f865222437559e243a489",
  render_errors: [view: QuestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Quest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Quest.Coherence.User,
  repo: Quest.Repo,
  module: Quest,
  web_module: QuestWeb,
  router: QuestWeb.Router,
  messages_backend: QuestWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :unlockable_with_token, :confirmable, :registerable]

config :coherence, QuestWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
