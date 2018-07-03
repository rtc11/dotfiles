# Deploy with tests
function deploy()
{
	echo -e "\e[36mmvn clean install aura:deploy -Dusername=admin -Dpassword=admin -Denv=\e[32m$1\e[0m"
	mvn clean install aura:deploy -Dusername=admin -Dpassword=admin -Denv=$1
}

# Deploy without tests
function fast_deploy()
{
	echo -e "\e[36mmvn clean install \e[32m-DskipTests \e[36m aura:deploy -Dusername=admin -Dpassword=admin -Denv=\e[32m$1\e[0m"
	mvn clean install -DskipTests aura:deploy -Dusername=admin -Dpassword=admin -Denv=$1
}

# Deploy without tests
function quiet_deploy()
{
    echo -e "\e[36mmvn clean install \e[32m-DskipTests -q\e[36m aura:deploy -Dusername=admin -Dpassword=admin -Denv=\e[32m$1\e[0m"
    mvn clean install -DskipTests -q aura:deploy -Dusername=admin -Dpassword=admin -Denv=$1
}

function argumented_deploy()
{
    echo -e "\e[36mmvn clean install \e[32m${@:2:5}\e[36m aura:deploy -Dusername=admin -Dpassword=admin -Denv=\e[32m$1\e[0m"
    mvn clean install ${@:2:5} aura:deploy -Dusername=admin -Dpassword=admin -Denv=$1
}

############################
# Options
############################
while test $# -gt 0; do
    if [ $# -eq 2 ]; then
        case "$2" in
            -f|--fast|--skipTests|-skipTests|-s|-DskipTests)
                fast_deploy $1
                exit 0
                ;;
            -q) 
                quiet_deploy $1
                exit 0
                ;;
            *)
                deploy $1
                break
                ;;
        esac
    else
        argumented_deploy $*
        exit 0
    fi
done
