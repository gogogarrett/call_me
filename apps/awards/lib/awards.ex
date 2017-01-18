defmodule Awards do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Awards.Eggs, []),
      worker(Awards.Pets, []),
    ]

    opts = [strategy: :one_for_one, name: Awards.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
