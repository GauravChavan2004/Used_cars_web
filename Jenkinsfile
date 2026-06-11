pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }
        stage('Clone Repository') {
            steps {
                git 'https://github.com/GauravChavan2004/Used_cars_web.git'
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                bat """
                wsl ansible-playbook /home/myansibleprj/django_prj_deploy.yml ^
                -e workspace_path='/mnt/c/ProgramData/Jenkins/.jenkins/workspace/django_Project@2'
                """
            }
        }
    }
}