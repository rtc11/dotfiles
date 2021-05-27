# Defined interactively
function jdk
export JAVA_HOME=(/usr/libexec/java_home -v$argv)
java -version
end
