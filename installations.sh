#! /bin/sh
sudo yum update -y
# use latest version for all installation

#docker
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user

## installing java
## use latest version
sudo yum -y install java-1.8.0-openjdk

# jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade

# Add required dependencies for the jenkins package
sudo yum install java-17-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload


#You can enable the Jenkins service to start at boot with the command:

sudo systemctl enable jenkins

#You can start the Jenkins service with the command:
sudo systemctl start jenkins

#You can check the status of the Jenkins service using the command:
sudo systemctl status jenkins
