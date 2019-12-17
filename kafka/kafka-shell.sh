#!/bin/bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e HOST_IP=127.0.0.1:9092 -e ZK=zookeeper:2181 -i -t confluentinc/cp-kafka:latest /bin/bash
