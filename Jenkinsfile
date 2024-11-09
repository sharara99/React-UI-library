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
                    sh "docker build -t sharara99/node-app:${BUILD_NUMBER} ."

                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    }

                    sh "docker push sharara99/node-app:${BUILD_NUMBER}"
                }
            }
        }

        stage('Deploy ArgoCD with Helm') {
            steps {
                script {
                    echo "Deploying ArgoCD using Helm..."
                    sh '''
                        ls -la
                        if [ -d "k8s/ArgoCD" ]; then
                            cd k8s/ArgoCD
                            ./deploy-argocd-minikube.sh
                        else
                            echo "Directory k8s/ArgoCD does not exist!"
                            exit 1
                        fi
                    '''
                }
            }
        }

        stage('Create ArgoCD Application') {
            steps {
                script {
                    echo "Creating ArgoCD Application..."
                    sh '''
                        # Apply the ArgoCD application configuration
                        cd k8s/ArgoCD
                        kubectl apply -f argocd-app.yaml
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for errors.'
        }
    }
}
