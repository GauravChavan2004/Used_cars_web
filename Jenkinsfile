pipeline {
    agent any

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/GauravChavan2004/Used_cars_web.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                bat 'ansible-playbook ansible/deploy.yml -i ansible/inventory.ini'
            }
        }
    }
}