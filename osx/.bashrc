export MAVEN_OPTS='-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=14122 -DsocksNonProxyHosts=127.0.0.1|dl.bintray.com|repo.maven.apache.org'

export M2_HOME=/usr/local/Cellar/maven/3.6.2
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:~/scripts
export PATH=$PATH:/usr/local/bin/kubectl

export JAVA_13_HOME=$(/usr/libexec/java_home -v 13)
export JAVA_11_HOME=$(/usr/libexec/java_home -v 11.0.2)
export JAVA_HOME=$JAVA_11_HOME

export KUBECONFIG=/Users/robintordly/projects/navikt/kubeconfigs/config

export PERSON_CONFIG_LOCATION=/Users/robintordly/config/person-local-config/


