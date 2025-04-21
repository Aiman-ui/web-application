pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Run Docker Containers') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
