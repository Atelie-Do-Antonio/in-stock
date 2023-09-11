defmodule Coretto.Repo do
  use Ecto.Repo,
    otp_app: :coretto,
    adapter: Ecto.Adapters.Postgres
end
