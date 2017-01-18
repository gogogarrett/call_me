defmodule Reports do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Reports.Vacuum, []),
    ]

    opts = [strategy: :one_for_one, name: Reports.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
