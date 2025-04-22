pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                checkout scm     // pulled latest code from GitHub
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker-compose build'    // used your Dockerfile to build image
                }
            }
        }
	stage('Clean Previous Containers') {
            steps {
                script {
                    sh 'docker rm -f static-site || true'    // killed any old leftover container
                }
            }
        }

        stage('Run Docker Containers') {
            steps {
                script {
                    sh 'docker-compose up -d'    // launched the site in container
                }
            }
        }
    }
}
