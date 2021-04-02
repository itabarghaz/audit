echo off
echo "@@@ Installer @@@"
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "IPv4"') do set ip=%%b
set ip=%ip:~1%
docker run -it -v %cd%:/usr/src --link sonarqube:7.9.4-community newtmitch/sonar-scanner:4-alpine -D sonar.host.url=http://%ip%:9000 -D sonar.projectBaseDir=./src -D sonar.sources=. -D sonar.projectName=%1 -D sonar.java.binaries=/usr/src/target/classes
echo "Sonarqube : http://localhost:9000"
pause