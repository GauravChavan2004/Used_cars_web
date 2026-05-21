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
                bat 'wsl ansible-playbook /home/myansibleprj/django_prj_deploy.yml'
            }
        }
    }
}