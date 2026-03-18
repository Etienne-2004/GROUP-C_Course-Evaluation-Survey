@echo off
echo Installing Maven and building project...
echo.
echo Step 1: Downloading Maven...
if not exist "apache-maven-3.9.6-bin.zip" (
    powershell -Command "Invoke-WebRequest -Uri 'https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip' -OutFile 'apache-maven-3.9.6-bin.zip'"
    echo Maven downloaded successfully
)

echo.
echo Step 2: Extracting Maven...
if not exist "maven" (
    powershell -Command "Expand-Archive -Path 'apache-maven-3.9.6-bin.zip' -DestinationPath '.'"
    rename "apache-maven-3.9.6" "maven"
    echo Maven extracted successfully
)

echo.
echo Step 3: Setting environment variables...
set MAVEN_HOME=%cd%\maven
set PATH=%MAVEN_HOME%\bin;%PATH%
echo Maven Home: %MAVEN_HOME%

echo.
echo Step 4: Building the project...
call mvn -version
echo.
call mvn clean package -DskipTests

echo.
echo Step 5: Running the application...
echo Starting Spring Boot application...
java -jar target\assessment-0.0.1-SNAPSHOT.war

pause
