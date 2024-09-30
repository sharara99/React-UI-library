pipeline {
    agent { label 'worker' }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'GitHub', url: 'https://github.com/sharara99/React-UI-library'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image and tag it with the Jenkins build number
                    sh "docker build -t sharara99/node-app:${BUILD_NUMBER} ."

                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    }

                    // Push the Docker image to Docker Hub with the build number tag
                    sh "docker push sharara99/node-app:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "Deploying to Kubernetes..."
                    
                    // Apply the Kubernetes namespace, service, and deployment YAML files
                    sh """
                    kubectl apply -f k8s/namespace.yml
                    kubectl apply -f k8s/service.yml
                    kubectl apply -f k8s/deployment.yml
                    """

                    // Wait for the deployment to be ready
                    sh "kubectl rollout status deployment/node-app -n node-app"
                    
                    // Update the Kubernetes deployment with the new Docker image (rolling update)
                    sh """
                    kubectl set image deployment/node-app node-app=sharara99/node-app:${BUILD_NUMBER} --record -n node-app
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! Kubernetes deployment was updated with the new Docker image.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
