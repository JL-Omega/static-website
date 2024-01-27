pipeline {
    environment{
        IMAGE_NAME = "webapp"
        IMAGE_TAG = "1.0.0"
        CONTAINER_NAME = "webapp"
        DOCKER_HUB_CREDENTIALS_ID = "dockerhub_jlkatobo"
        
        ID_RSA = credentials("aws_key")
        SERVER_USER = "ubuntu"
        SERVER_IP = "35.175.238.136"
    }
    agent none
    stages{
        stage('build-webapp'){
            agent any
            steps{
                script{
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }
        stage('test-webapp'){
            agent any
            steps{
                script{
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                    sh "docker run --name ${CONTAINER_NAME} -d -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "sleep 10"
                    sh "curl -X GET http://localhost:80 | grep -i 'dimension'"
                }
            }
        }
        stage('artifact-webapp'){
            agent any
            steps{
                script{
                    sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} jlkatobo/${IMAGE_NAME}:${IMAGE_TAG}"
                    withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS_ID, usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "docker login -u $USERNAME -p $PASSWORD"
                    }
                    sh "docker push jlkatobo/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
        stage('deployment-webapp'){
            agent any
            steps{
                script{
                    sh "cat $DOCKER_HUB_USERNAME"
                }
            }
        }
    }
}