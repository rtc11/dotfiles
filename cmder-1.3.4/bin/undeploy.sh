if [ $# -eq 0 ]; then
	echo "mvn aura:undeploy -Dapps=aktoerid:3.0.8-SNAPSHOT -Denv=u1 -Dusername=admin -Dpassword=admin"
else
	#mvn aura:undeploy -Dapps=aktoerid:3.0.8-SNAPSHOT -Denv=u1 -Dusername=admin -Dpassword=admin
	mvn aura:undeploy -Dapps=aktoerid:$1 -Denv=$2 -Dusername=admin -Dpassword=admin
fi