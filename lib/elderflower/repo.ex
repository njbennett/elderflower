defmodule Elderflower.Repo do
  use Ecto.Repo,
    otp_app: :elderflower,
    adapter: Ecto.Adapters.SQLite3
end
