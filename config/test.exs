import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elderflower, ElderflowerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "WK6P2S9Gmx9VkSV+AcU/Wlg7qwubceVEFN8MkYweS/cI74vcI/POWdm+wzYYrjxs",
  server: false

# In test we don't send emails.
config :elderflower, Elderflower.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
