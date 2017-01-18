defmodule Cellphone do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Cellphone.Jepsen, []),
    ]

    opts = [strategy: :one_for_one, name: Cellphone.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
