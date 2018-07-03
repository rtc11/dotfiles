#!/bin/sh

output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$2/applications/$1/full)
hostname=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .hostname)

if [[ $output = *"is not defined in environment"* ]]; then

    echo -e "\e[31m" $output "\e[0m"

else

	ssh deployer@$hostname

fi