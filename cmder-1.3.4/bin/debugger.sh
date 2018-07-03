#!/usr/bin/expect -f

########
#  This script is on the local machine
########
output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$2/applications/$1/full)
hostname=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .hostname)

ssh deployer@$hostname -t 'sudo sh enable-debugger.sh'
# spawn ssh deployer@$hostname -t 'sudo sh enable-debugger.sh'
# expect "assword:"
# send "imusedtodeploystuff\r"
# interact
