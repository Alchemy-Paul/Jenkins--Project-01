### Java installation
$ sudo apt update
$ sudo apt install openjdk-17-jre

# java -version
### openjdk version "17.0.7" 2023-04-18
# OpenJDK Runtime Environment (build 17.0.7+7-Debian-1deb11u1)
# OpenJDK 64-Bit Server VM (build 17.0.7+7-Debian-1deb11u1, mixed mode, sharing)

# Jenkins
$ curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
$ echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
$ sudo apt-get update
$ sudo apt-get install jenkins

# Start Jenkins

# You can enable the Jenkins service to start at boot with the command

$ sudo systemctl enable jenkins

# You can start the Jenkins service with the command
$ sudo systemctl start jenkins

# You can check the status of the Jenkins service using the command
$ sudo systemctl status jenkins

# docker
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ apt-cache policy docker-ce
$ sudo apt install docker-ce
$ sudo systemctl status docker

# add jenkins to docker user group
$ sudo usermod -aG docker username

# use jenkins user
$ su jenkins

###
# create a folder for github
$ mkdir Github
$ cd Github
$ mkdir .ssh
$ ls -al
total 4 (depends on your end)
drwxrwxr-x. 3 jenkins jenkins 19 Sept 14 23:33 .
drwxr-xr-x. 30 jenkins jenkins 4096 Sept 14 23:33 ..
drwxrwxr-x. 2 jenkins jenkins 8 Sept 22 14:33 .ssh

# generate an ssh key pair and save it in the new location
$ ssh-keygen -t rsa
# Generating public/private rsa key pair.
# Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): /var/lib/jenkins/Github/.ssh/id_rsa
# Enter passphrase (empty for no passphrase):
# Enter same passphrase again:
# Your identification has been saved in /var/lib/jenkins/Github/.ssh/id_rsa.
# Your public key has been saved in /var/lib/jenkins/Github/.ssh/id_rsa.pub.
# The key fingerprint is:
# 62:08:8a:20:fg:g5:36:pn:36:cf:a8:cv:s0:r1:f1:65 jenkins@localhost.localdomain
# The key's randomart image is:
+--[ RSA 2048]----+
| . =. |
| oo Oo |
| o=o= |
| . .o + |
| S . = |
| . . = . E|
| * o |
| . o |
| |
+-----------------+

# cd into .ssh folder and copy the rsa.pub key
$ cat id_rsa.pub

# paste the key in your github/settings/deploy

# open jenkins and continue the by creating a pipeline job


# NOTE: I USED THE REACT-DEMO-APP
