defmodule Mail.CompleteMap do
  defmacro routing_key(routing_key) do
    quote do
      use GenServer
      use AMQP

      def start_link do
        GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
      end

      def init(:ok) do
        {:ok, connection} = AMQP.Connection.open
        {:ok, channel} = AMQP.Channel.open(connection)

        AMQP.Exchange.declare(channel, "events", :topic)

        {:ok, %{queue: queue_name}} = AMQP.Queue.declare(channel, "", exclusive: true)
        AMQP.Queue.bind(channel, queue_name, "events", routing_key: unquote(routing_key))
        AMQP.Basic.consume(channel, queue_name, nil, no_ack: true)

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
        IO.inspect("sending a mail for #{unquote(routing_key)}")
        {:noreply, chan}
      end
    end
  end
end
