pipeline {
    agent any

    tools {
        maven 'Maven3'   // Make sure Maven is configured in Jenkins
        jdk 'jdk-21'     // Make sure JDK is configured in Jenkins
    }

    environment {
        DOCKER_IMAGE = "springboot-docker-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/anavi2002/SampleRepo.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh "mvn clean package -DskipTests"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:latest ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker stop ${DOCKER_IMAGE} || true && docker rm ${DOCKER_IMAGE} || true"
                sh "docker run -d --name ${DOCKER_IMAGE} -p 8082:8082 ${DOCKER_IMAGE}:latest"
            }
        }
    }

    post {
        success {
            echo '✅ Build & Deployment Successful!'
        }
        failure {
            echo '❌ Build Failed!'
        }
    }
}
