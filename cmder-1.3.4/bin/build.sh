#!/bin/sh
echo -ne "\e[36m mvn clean install -DskipTests"
echo -e "\e[0m"
echo "..."
mvn clean install -DskipTests