sudo apt update -y
sudo apt install openjdk-17-jre unzip -y
sudo groupadd sonarqube
cd /home/ubuntu
wget "https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.4.87374.zip"
unzip sonarqube-9.9.4.87374
chown -R ubuntu:sonarqube sonarqube-9.9.4.87374
sudo chmod -R 755 sonarqube-9.9.4.87374
cd sonarqube-9.9.4.87374/bin/linux-x86-64
sudo ./sonar.sh start