defmodule Foo.Router do
  use Plug.Router

  plug Plug.Logger

  plug Plug.Static, at: "/", from: :foo

  plug :match
  plug :dispatch

  get "/", do: send_file(conn, 200, "priv/static/index.html")
  match _, do: send_resp(conn, 404, "Oops!")
end
