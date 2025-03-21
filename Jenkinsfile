pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "prajaktanaik17/flask_project_devops"  // Change to your Docker Hub username
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/PrajaktaNaik17/flask_project_devops'
            }
        }

        stage('Build Application') {
            steps {
                sh 'pip install -r requirements.txt'  // Install dependencies
            }
        }

        stage('Run Tests') {
            steps {
                sh 'pytest tests/'  // Run unit tests
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to AWS') {
            steps {
                sshagent(['aws-ssh-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@13.235.81.36 "docker pull $DOCKER_IMAGE && docker run -d -p 9090:9090 $DOCKER_IMAGE"'
                }
            }
        }
    }
}
