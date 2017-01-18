defmodule Mail do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Mail.CompleteMap.Maths, []),
      worker(Mail.CompleteMap.Rex, []),
      worker(Mail.CompleteMap.Re, []),
    ]

    opts = [strategy: :one_for_one, name: Mail.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
