require "ruby-kafka"

# Configure the Kafka client with the broker hosts and the Rails
# logger.
$kafka = Kafka.new(["127.0.0.1:9092"], logger: Rails.logger)

# Set up an asynchronous producer that delivers its buffered messages
# every ten seconds:
$kafka_producer = $kafka.async_producer(
  delivery_interval: 10,
)


# $kafka.create_topic("post_events",
#     num_partitions: 3,
# #    replication_factor: 2,
#     config: {
#       "max.message.bytes" => 100000
#     }
#   )

# Make sure to shut down the producer when exiting.
at_exit { $kafka_producer.shutdown }