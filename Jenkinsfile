pipeline {
    environment{
        IMAGE_NAME = "webapp"
        IMAGE_TAG = "1.0.0"
        CONTAINER_NAME = "webapp"
        DOCKER_HUB_USERNAME = "jlkatobo"
        DOCKER_HUB_PASSWORD = "Jl0931607671"
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
                    sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                    sh "docker push jlkatobo/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}