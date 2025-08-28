defmodule Link42.Repo do
  use Ecto.Repo,
    otp_app: :link42,
    adapter: Ecto.Adapters.Postgres
end
