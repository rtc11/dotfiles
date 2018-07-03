# https://waslogger.adeo.no/environment/prod/


function get_nodes() {
	output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/p/applications/$1/full)
	nodes=$(echo "$output" | jq .cluster | jq .nodes | jq length)
    count=$((nodes-1))

    echo "Register: $1"

    for i in $(seq 0 $count) 
    do 
        node=$(echo "$output" | jq .cluster | jq .nodes | jq .[$i] | jq -r .hostname)
        
    	# TODO: bl.a TP, NORG og MEDL har andre paths.
        echo "https://waslogger.adeo.no/environment/prod/$node/logs2/$1/app/"
    done;   
}


function get_all_nodes() {

	declare -a arr=("NORG" "NORG2" "MEDL" "INST" "TP" "AAREG-core" "EREG" "Aktoerid" "Sakogbehandling" "Kodeverk" "Inntektskomponenten" "digital-kontaktinformasjon")

	for register in "${arr[@]}"
	do
	 	get_nodes $register
	done
}

############################
# Options
############################
while test $# -gt 0; do
    case "$1" in
        -a|--all)
            get_all_nodes
            exit 0
            ;;
        *)
			get_nodes $1
            break
            ;;
    esac
done