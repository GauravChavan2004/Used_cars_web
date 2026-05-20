pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/GauravChavan2004/Used_cars_web.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t django_project .'
            }
        }

        stage('Run Docker Container') {
            steps {
                bat 'docker stop django_container || exit 0'
                bat 'docker rm django_container || exit 0'
                bat 'docker run -d -p 8000:8000 --name django_container django_project'
            }
        }
    }
}