# Finn alle applikasjoner i et miljø og put i en liste til clipboard
### curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/environments/u5/applications | jq -r .[].name | clip

function get_datasources()
{
    declare -a arr=("NORG" "NORG2" "MEDL" "INST" "TP" "AAREG-core" "EREG" "Aktoerid" "Sakogbehandling" "Kodeverk" "Inntektskomponenten" "digital-kontaktinformasjon")

    for register in "${arr[@]}"
    do
        output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/p/applications/$register/full)
        usedResources=$(echo "$output" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .properties.username')
        echo -n "$usedResources, "
    done
}

# USAGE: app_env_addr u1 aktoerid
# rest u1 aktoerid
function app_env_addr()
{
    output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$1/applications/$2/full)


    if [[ $output = *"is not defined in environment"* ]]; then

            echo -e "\e[31m" $output2 "\e[0m"

    else

        main $1 $2 $3 $output

    fi

 

}

function nodes() {

    #https://waslogger.adeo.no/environment/prod/a01jbsl00212.adeo.no/logs2/norg2/app/

    #output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$1/applications/$2/full)

    declare -a arr=("NORG" "NORG2" "MEDL" "INST" "TP" "AAREG-core" "EREG" "Aktoerid" "Sakogbehandling" "Kodeverk" "Inntektskomponenten" "digital-kontaktinformasjon")
    
    for register in "${arr[@]}"
    do
        output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/p/applications/$register/full)
        nodes=$(echo "$output" | jq .cluster | jq .nodes | jq length)
        count=$((nodes-1))

        echo "Register: $register"

        for i in $(seq 0 $count) 
        do 
            node=$(echo "$output" | jq .cluster | jq .nodes | jq .[$i] | jq -r .hostname)
            echo "Node: $node"
        done;    
    done



}

function main()
{
    hostname=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .hostname)
    version=$(echo "$output" | jq -r .version)

    environment=$(echo "$output" | jq -r .cluster | jq -r .environmentName)
    platform=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .platformType)
    
    passwordRef=$(echo "$output" | jq .cluster | jq .nodes | jq .[] | jq -r .passwordRef)
    password=$(curl -s -u T147539:Viskptrjan18 $passwordRef)
    
    # Exposed Resources
    exposedServicesCount=$(echo "$output" | jq .exposedServices | jq length)
    count=$((exposedServicesCount-1))

    # Used Resources
    usedResources=$(echo "$output" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .properties.username') 
    dataSourceUrl=$(echo "$output" | jq -r '.usedResources | .[] | select(.type=="DataSource") | .properties.url') 

    echo -e "\e[36m╔═══════════════════════════════════════════════════════"
    echo -e "\e[36m║\e[37m ★ Name:      "$2 "\e[0m"
    echo -e "\e[36m║\e[37m Version:    \e[0m" $version
    echo -e "\e[36m║\e[37m Environment \e[0m" $environment
    echo -e "\e[36m║"
    echo -e "\e[36m║\e[37m Platform:   \e[0m" $platform
    echo -e "\e[36m║\e[37m Hostname:   \e[32m" $hostname
    echo -e "\e[36m║\e[37m password:    \e[1" $password
    echo -e "\e[36m║"
    echo -e "\e[36m║\e[37m Datasource: \e[0m" $usedResources
    echo -e "\e[36m║\e[37m Url:        \e[0m" $dataSourceUrl
    echo -e "\e[36m║"
    echo -e "\e[36m║\e[37m\e[1m Services:   \e[32m" $exposedServicesCount "(rest -e $1 $2) \e[0m" 


    if [ $3 == "extra" ]; then
        for i in $(seq 0 $count) 
        do 
            exposedServices=$(echo "$output" | jq .exposedServices |jq .[$i] | jq -r .alias)
            endpointUrl=$(echo "$output" | jq .exposedServices | jq .[$i] | jq .properties | jq -r .endpointUrl)
            echo -e "\e[36m║\e[0m Alias:      \e[32m" $exposedServices
            echo -e "\e[36m║\e[0m Url:        \e[32m" $endpointUrl
        done;
    fi
    
    echo -e "\e[36m╚═══════════════════════════════════════════════════════"
    echo -e "\e[0m"
}




# rest find u1 akt
function find()
{
    output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/environments/$1/applications)
    declare -a arr=$(echo "$output" | jq -r .[].name)
    echo "$arr" | grep $2 --color
}

# Get appconfig for application in environment
function app_config()
{
    output=$(curl -s -H "Accept: application/xml" -H "Content-Type: text/html" -L https://fasit.adeo.no/conf/environments/$1/applications/$2/appconfig)
    echo $output
    echo $output | clip
}

############################
# Options
############################
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Find applications in environment with substring:"
            echo "  rest find u1 akt"
            echo "  rest -f u1 akto"
            echo "Get application in environment:"
            echo " rest u1 aktoerid"
            echo "Get application in environment with extras:"
            echo " rest -e u1 aktoerid"
            exit 0
            ;;
        -f)
            find $2 $3
            exit 0
            ;;
        -e|--extra)
            app_env_addr $2 $3 extra
            exit 0
            ;;
        -n|--nodes)
            nodes
            exit 0
            ;;
        *)
            break
            ;;
    esac
done


############################
# Arguments
############################
if [ $# -eq 1 ]; then
    if [ $1 == "ds" ]; then
        get_datasources
    fi
elif [ $# -eq 2 ]; then
    app_env_addr $1 $2 simple
elif [ $# -eq 3 ]; then

    # rest appconfig u1 aktoerid
    if [ $1 == "config" ]; then
        app_config $2 $3

    # rest find u1 akt
    elif [ $1 == "find" ]; then
        find $2 $3

    fi
fi

