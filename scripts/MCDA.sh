# Some scripts for MCDA project

startKafkaConnector () {
    java -jar $CONNECTOR_HOME/simpol-tcp-connector.jar $1
}

startSimpol () {
    startKafkaConnector $1 &
    workon simpol &&
    python $SIMPOL_HOME/index.py &
}

startZookeeper () {
    $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
}

startKafka () {
    startZookeeper & $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
}

createKafkaTopic () {
    $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $1
}

listenToKafka () {
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
}

addToKafka () {
    $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
}
