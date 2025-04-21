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
          dockerImage = docker.build("kids-bed-app:${env.BUILD_ID}")
        }
      }
    }

    stage('Run Container') {
      steps {
        script {
          dockerImage.run("-p 3000:3000")
        }
      }
    }

    stage('Validation') {
      steps {
        sh 'curl --fail http://localhost:3000 || exit 1'
      }
    }
  }

  post {
    always {
      echo "Cleaning up..."
      sh 'docker container prune -f || true'
      sh 'docker image prune -f || true'
    }
  }
}
