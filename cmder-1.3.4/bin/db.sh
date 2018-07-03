#!/bin/bash

function print()
{
    uri="W:\FREG\credentials\jdbc\\$1$2.txt"
    user=$(sed -n '1p' < $uri)
    password=$(sed -n '2p' < $uri)
    url=$(sed -n '3p' < $uri)

    echo -e "\e[36m╔═══════════════════════════════════════════════════════════════════════"
    echo -e "\e[36m║\e[37m USR:  \e[32m" $user
    echo -e "\e[36m║\e[37m PWD:  \e[32m" $password
    echo -e "\e[36m║\e[37m URL:  \e[32m" $url
    echo -e "\e[36m╚═══════════════════════════════════════════════════════════════════════"
    echo -e "\e[0m"
}

while test $# -gt 0; do
    case "$1" in
        aktoerid)
            print aktoerid- $2
            exit 0
            ;;
        aareg|aareg-core)
            print aareg- $2
            exit 0
            ;;
        a-inntekt)
            print a-inntekt- $2
            exit 0
            ;;
        bprof)
            print bprof- $2
            exit 0
            ;;
        dkif)
            print dkif- $2
            exit 0
            ;;
        inntk|inntektskomponenten)
            print inntk- $2
            exit 0
            ;;
        medl)
            print medl- $2
            exit 0
            ;;
        norg)
            print norg- $2
            exit 0
            ;;
        kodeverk)
            print kodeverk- $2
            exit 0
            ;;
        sob)
            print sob- $2
            exit 0
            ;;
        sob-proxy)
            print sob-proxy- $2
            exit 0
            ;;
        tpsws)
            print tpsws- $2
            exit 0
            ;;
        *)
            break
            ;;
    esac
done