defmodule Debut.Repo do
  use Ecto.Repo,
    otp_app: :debut,
    adapter: Ecto.Adapters.Postgres
end
