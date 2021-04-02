echo off
echo "@@@ Installer @@@"
docker pull sonarqube:7.9.4-community
docker stop sonarqube
docker rm sonarqube
echo "Installer sonarqube , merci de patienter ..."
docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:7.9.4-community
timeout /t 180 /nobreak
echo "Install sonar scanner ..."
docker pull newtmitch/sonar-scanner:4-alpine
echo "Ajouter scanner dans le path"
setx PATH %cd%
echo "Voici l'adresse de sonarqube http://localhost:9000"
pause