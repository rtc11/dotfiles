#! /bin/bash
function copy()
{
	token=$(echo "$auth" | jq .idToken -r)
	echo -n "Bearer $token" | pbcopy
	echo -e "Bearer $token"
}

auth=$(curl -s -k "http://freg-token-provider/token/user" -H "username: Z991052" -H "password: Passord123")
copy $auth
