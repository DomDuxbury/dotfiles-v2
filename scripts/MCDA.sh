# Some scripts for MCDA project

startKafkaServices () {
    sudo systemctl start simpolconnector.service &
    sudo systemctl start frontendconnector.service &
}

startSimpol () {
    workon simpol2 &&
    python $SIMPOL_HOME/index.py
}

startFrontend () {
    cd $FRONTEND_HOME && tmux split-window "npm run dev" &
}

startDevEnvironment() {
    startKafkaServices && startFrontend
}

createKafkaTopic () {
    $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic $1
}

listenToKafka () {
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic $1 --from-beginning
}

listenToKafkaProd () {
    $KAFKA_HOME/bin/kafka-console-consumer.sh --bootstrap-server 35.197.214.134:9092 --topic $1 --from-beginning
}

addToKafka () {
    $KAFKA_HOME/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
}

createKafkaTopicProd () {
    $KAFKA_HOME/bin/kafka-topics.sh --create --bootstrap-server 35.197.214.134:9092 --replication-factor 1 --partitions 1 --topic $1
}
