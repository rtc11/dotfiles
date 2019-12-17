#! /bin/bash
function copy()
{
	token=$(echo "$auth" | jq .access_token -r)
	clipboard=$(echo -n "Bearer $token")
	echo -n "$clipboard" | pbcopy
	echo -e "$clipboard"
}

auth=$(curl -s -k -u "srvperson-forvalter:7s20mblMyeMLpyN" "http://security-token-service/rest/v1/sts/token?grant_type=client_credentials&scope=openid")
copy $auth
