#!/bin/sh

function fasit()
{
	read -p "Username: " usr
	read -s -p "Password: " pass
	echo ""

	for app in "${applications[@]}"
	do
		for env in "${environments[@]}"
		do
			response=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$env/applications/$app/full)

		    if [[ $response = *"not found"* ]]; then

				echo -e "\e[36mEnvironment $env not found \e[0m"

			elif [[ $response = *"is not defined in environment"* ]]; then

				echo -e "\e[36mApplication $app not found in $env \e[0m"

		    else

		        fetch $app $env $response $usr $pass

		    fi

		 done
	done
}

function csv()
{
	firstLine=$(sed -n '1p' "$1")
	secondLine=$(sed -n '2p' "$1")

	IFS=, read -ra applications <<< $firstLine
	IFS=, read -ra environments <<< $secondLine

	fasit $applications $environments

}

function fetch()
{
	name="$app - $env.properties"
	username=$(echo "$response" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .properties.username') 
	url=$(echo "$response" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .properties.url') 
	datasource=$(echo "$response" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .alias') 

	datasourceResponse=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L "https://fasit.adeo.no/conf/resources?envName=$env&app=$app&alias=$datasource&usage=false")	
	passwordRef=$(echo "$datasourceResponse" | jq -r '.[] | .property | .[] | select(.type=="SECRET") | .ref')
	password=$(curl -s -u $usr:$pass $passwordRef)

	if [[ $password = *"Bad credentials"* ]]; then
		echo -e "\e[31mBad credentials \e[0m"
	else
		rm -f "$name"
		echo "jdbc.driverClassName=oracle.jdbc.OracleDriver" >> "$name"
		echo "jdbc.url=$url" >> "$name"
		echo "jdbc.username=$username" >> "$name"
		echo "jdbc.password=$password" >> "$name"
		echo -e "\e[32mCreated '$name'\e[0m"
	fi

}

############################
# Options
############################
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Run:"
            echo "sh datasources.sh input.csv"
            echo ""
            echo "input.csv example:"
            echo "NORG,NORG2,MEDL"
            echo "U1,U2,T7,Q0"
            exit 0
            ;;
        *)
			if [ $# -eq 1 ]; then
				csv $1
			else
				echo -e "\e[31mMissing CSV file \e[0m"
			fi
			break;
		;;
    esac
done