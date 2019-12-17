 zookeeper=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' confluentinc_zookeeper_1)
 echo "using zookeeper ip: $zookeeper"
 docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --create --topic $1 --partitions 1 --replication-factor 1 --if-not-exists --zookeeper $zookeeper:2181
 
