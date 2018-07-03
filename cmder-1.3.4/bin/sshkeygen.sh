output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$2/applications/$1/full)
hostname=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .hostname)

ssh-keygen -t rsa
ssh-copy-id deployer@$hostname
