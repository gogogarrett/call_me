defmodule Cellphone.Jepsen do
  use GenServer
  use AMQP

  @topic "event.event.event"

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def publish_event(event) do
    GenServer.cast(__MODULE__, {:publish_event, event})
  end

  def publish_event(topic, event) do
    GenServer.cast(__MODULE__, {:publish_event, topic, event})
  end

  def init(:ok) do
    {:ok, connection} = Connection.open
    {:ok, channel} = Channel.open(connection)

    Exchange.declare(channel, "events", :topic)

    {
      :ok,
      %{
        connection: connection,
        channel: channel,
      }
    }
  end

  def handle_cast({:publish_event, event}, %{channel: channel} = state) do
    Basic.publish(channel, "events", @topic, event)

    {:noreply, state}
  end

  def handle_cast({:publish_event, topic, event}, %{channel: channel} = state) do
    Basic.publish(channel, "events", topic, event)

    {:noreply, state}
  end
end
