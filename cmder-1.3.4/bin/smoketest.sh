echo -n Username: 
read username
echo -n Password:
read -s password
echo

mvn clean verify -Psmoketest -Dtest.environment=$1 -Dfasit.username=$username -Dfasit.password=$password -Djavax.net.ssl.trustStore="C:\config\nav_truststore_nonproduction.jts" -Djavax.net.ssl.trustStorePassword=467792be15c4a8807681fd2d5c9c1748