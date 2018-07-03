############################
# OIDC-token for isso-q
############################
function isso_q()
{
	auth=$(curl -k -s -X GET "https://freg-token-provider-q4.nais.preprod.local/token/user" -H "accept: */*" -H "username: z991052" -H "password: Passord123")
	copy $auth
}

############################
# OIDC-token for isso-t
############################
function isso_t()
{
	auth=$(curl -k -s -X GET "https://freg-token-provider.nais.preprod.local/token/user" -H "accept: */*" -H "username: z991052" -H "password: Passord123")
	copy $auth
}

############################
# Copy to clipboard
############################
function copy()
{
	token=$(echo "$auth" | jq .idToken -r)
	clipboard=$(echo -n "Bearer $token")
	echo -n "$clipboard" | clip
	echo -e "Copied Authorization: \e[31m$clipboard\e[0m"
}

############################
# Options
############################
while test $# -gt 0; do
    case "$1" in
        -t | -T | t | T)
            isso_t
            exit 0
            ;;
        -q | -Q | q | Q )
            isso_q
            exit 0
            ;;
        *)
            break
            ;;
    esac
done