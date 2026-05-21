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

        stage('Wait for MySQL') {
            steps {
                bat 'timeout /t 40'
            }
        }

        stage('Run Migrations') {
            steps {
                bat 'docker exec django_container python manage.py migrate'
            }
        }
    }
}