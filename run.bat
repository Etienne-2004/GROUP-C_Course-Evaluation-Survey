@echo off
echo Starting Spring Boot Application...
set JAVA_HOME=C:\Program Files\Java\jdk-23.0.1
set PATH=%JAVA_HOME%\bin;%PATH%
echo Java version:
java -version
echo.
echo Compiling and running the application...
java -jar target/assessment-0.0.1-SNAPSHOT.war
