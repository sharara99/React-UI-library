pipeline {
    agent { label 'worker' }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'GitHub', url: 'https://github.com/sharara99/React-UI-library'
            }
        }

        stage('Build') {
            steps {
                script {
                    sh "cd library"
                    sh "docker build -t sharara99/node-app:${BUILD_NUMBER} ."

                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    }

                    sh "docker push sharara99/node-app:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying on Kubernetes..."
                    sh """
                    kubectl apply -f k8s/namespace.yml
                    kubectl apply -f k8s/deployment.yml
                    kubectl apply -f k8s/service.yml
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
