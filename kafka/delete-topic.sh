 zookeeper=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' confluentinc_zookeeper_1)
 echo "using zookeeper ip: $zookeeper"
 docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --delete --topic $1 --zookeeper $zookeeper:2181
 
