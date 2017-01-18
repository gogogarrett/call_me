defmodule Awards.Pets do
  use GenServer
  use AMQP

  @topic "event.#.complete_lesson"

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    {:ok, connection} = Connection.open
    {:ok, channel} = Channel.open(connection)

    Exchange.declare(channel, "events", :topic)

    {:ok, %{queue: queue_name}} = Queue.declare(channel, "", exclusive: true)
    Queue.bind(channel, queue_name, "events", routing_key: @topic)
    Basic.consume(channel, queue_name, nil, no_ack: true)

    {:ok, channel}
  end

  # Confirmation sent by the broker after registering this process as a consumer
  def handle_info({:basic_consume_ok, %{consumer_tag: consumer_tag}}, chan) do
    {:noreply, chan}
  end

  # Sent by the broker when the consumer is unexpectedly cancelled (such as after a queue deletion)
  def handle_info({:basic_cancel, %{consumer_tag: consumer_tag}}, chan) do
    {:stop, :normal, chan}
  end

  # Confirmation sent by the broker to the consumer process after a Basic.cancel
  def handle_info({:basic_cancel_ok, %{consumer_tag: consumer_tag}}, chan) do
    {:noreply, chan}
  end

  def handle_info({:basic_deliver, payload, %{delivery_tag: tag, redelivered: redelivered}}, chan) do
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    random = list |> Enum.shuffle |> hd
    if rem(random, 2) == 0 do
      IO.inspect("AWARDS: awarding pets if it hasn't been awarded before.")
    end
    {:noreply, chan}
  end
end
