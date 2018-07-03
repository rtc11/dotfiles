@echo off
echo Setting JAVA_HOME to JAVA_7 (1.7)
setx JAVA_HOME "%JAVA_7%" /M
echo JAVA_HOME: %JAVA_HOME%
echo Display Java version
java -version
PAUSE