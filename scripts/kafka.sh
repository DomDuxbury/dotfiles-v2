# Some scripts for MCDA project

startKafka () {
  sudo kafka-server-start.sh $KAFKA_HOME/config/server.properties
}

createKafkaTopic () {
  kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $1
}

listenToKafka () {
  kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
}

addToKafka () {
  kafka-console-producer.sh --bootstrap-server localhost:9092 --topic $1
}
