pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/GauravChavan2004/Used_cars_web.git'
            }
        }

        stage('Stop Old Containers') {
            steps {
                bat 'docker-compose down || exit 0'
            }
        }

        stage('Build and Run Containers') {
            steps {
                bat 'docker-compose up --build -d'
            }
        }
    }
}