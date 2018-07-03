@echo off
echo Setting JAVA_HOME to JAVA_8 (1.8)
setx JAVA_HOME "%JAVA_8%" /M
echo JAVA_HOME: %JAVA_HOME%
echo Display Java version
java -version
PAUSE