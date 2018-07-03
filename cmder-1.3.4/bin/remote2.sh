#!/bin/bash

function print()
{

    # NAV ident
    nav_ident="t147539"

    # NAV passord
    nav_password="Viskptrsep16"

    # Fasit curl request/response
    output=$(curl -s -H "Accept: application/json" -H "Content-Type: application/json" -L https://fasit.adeo.no/conf/v1/environments/$2/applications/$1/full)
    
    # Check that the curl response is valid
    if [[ $output = *"is not defined in environment"* ]]; then    
        echo $output
    else

        # Remote server username from fasit
        deployer=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .username)
        
        # Host address from fasit
        hostname=$(echo "$output" | jq .cluster | jq .nodes | jq .[0] | jq -r .hostname)
        
        # URL where password is stored
        passwordRef=$(echo "$output" | jq .cluster | jq .nodes | jq .[] | jq -r .passwordRef)
        
        # Password to remote server from fasit
        password=$(curl -s -u $nav_ident:$nav_password $passwordRef)

        # If the user does not have access to the password: check if the password is stored in a file
        if [[ $password == *"No access to secret"* ]]; then
            
            uri="W:\FREG\credentials\remote\\$1-$2.txt"

            # Check if the password file exists
            if [ -s $uri ]; then
                password=$(sed -n '1p' < $uri)
                cat $uri | clip
            fi
        else
            echo $password | clip
        fi

        echo -e "\e[36m╔═══════════════════════════════════════════════════════════════════════"
        echo -e "\e[36m║\e[37m USR:  \e[32m" $deployer@$hostname
        echo -e "\e[36m║\e[37m PWD:  \e[32m $password \e[31m(Copied to clipboard)\e[0m"
        echo -e "\e[36m╚═══════════════════════════════════════════════════════════════════════"
        echo -e "\e[0m"
    
        $(ssh $deployer@$hostname)

    fi
}

while test $# -gt 0; do
    case "$1" in
        aktoerid)
            print aktoerid $2
            exit 0
            ;;
        aareg|aareg-core)
            print aareg $2
            exit 0
            ;;
        a-inntekt)
            print a-inntekt $2
            exit 0
            ;;
        bprof)
            print bprof $2
            exit 0
            ;;
        dkif)
            print dkif $2
            exit 0
            ;;
        inntk|inntektskomponenten)
            print inntk $2
            exit 0
            ;;
        medl)
            print medl $2
            exit 0
            ;;
        norg)
            print norg $2
            exit 0
            ;;
        kodeverk)
            print kodeverk $2
            exit 0
            ;;
        sob)
            print sob $2
            exit 0
            ;;
        sob-proxy)
            print sob-proxy $2
            exit 0
            ;;
        tpsws)
            print tpsws $2
            exit 0
            ;;
        *)
            break
            ;;
    esac
done