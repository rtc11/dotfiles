@echo off
echo Setting JAVA_HOME to JAVA_6_IBM (1.6)
setx JAVA_HOME "%JAVA_6_IBM%" /M
echo JAVA_HOME: %JAVA_HOME%
echo Display Java version
java -version
PAUSE