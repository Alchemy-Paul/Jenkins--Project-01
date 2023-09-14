pipeline {
    agent any
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Alchemy-Paul/react_django_demo_app.git'
            }
        }

        stage('Testing') {
            steps {
                echo 'Testing'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build --no-cache -t react_django_demo_app .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -p 8001:8001 -d react_django_demo_app'
                }
            }
        }
    }
}
