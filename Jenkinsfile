pipeline {
    environment{
        IMAGE_NAME = "webapp"
        IMAGE_TAG = "1.0.0"
        CONTAINER_NAME = "webapp"
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
    }
}