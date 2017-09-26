defmodule Foo.Application do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:foo, :cowboy_port, 4000)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Foo.Router, [], port: port)
    ]

    Logger.info "Application running on port " <> (to_string port)

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
