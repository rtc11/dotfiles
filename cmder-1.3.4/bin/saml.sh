#!/bin/bash

function print()
{
    uri="W:\FREG\\$1"
    cat $uri | clip
    echo -e "$1 \e[31m(Copied)\e[0m"
}

while test $# -gt 0; do
    case "$1" in
        -u|-U|-t|-T|u|U|t|T)
            print SAML-T.txt
            exit 0
            ;;
        -q|-Q|q|Q)
            print SAML-Q.txt
            exit 0
            ;;
        -Q-NORG|-q-norg|q-norg|Q-NORG|qnorg|QNORG|-QNORG|-qnorg)
            print SAML-Q-NORG.txt
            exit 0
            ;;
        *)
            break
            ;;
    esac
done