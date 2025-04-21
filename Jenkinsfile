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
	stage('Clean Previous Containers') {
            steps {
                script {
                    sh 'docker rm -f static-site || true'
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
