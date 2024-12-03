pipeline {
    agent any

    environment {
        //REACT_APP_VERSION = "1.0.$BUILD_ID"
        //APP_NAME = 'plano-website'       
        AWS_DEFAULT_REGION = 'us-west-2'
        //AWS_DOCKER_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com'
        //AWS_ECS_CLUSTER = 'LearnJenkinApp-Cluster-Prod'
        //AWS_ECS_SERVICE_PROD = 'LearnJenkinsApp-Service-Prod'
        //AWS_ECS_TD_PROD = 'LearnJenkinsApp-TaskDefinition-Prod'
    }

    stages {
        stage('Checkout GitHub Code') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-cred', poll: false, url: 'https://github.com/max-az-10/Plato.git'
            }
        }

        stage('Build Docker image') {
            agent {
                docker {
                    image 'nginx:1.27-alpine'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                    reuseNode true
                }
            }
            
            steps {
                withCredentials([usernamePassword(credentialsId: 'my-aws', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    // some block
                sh '''
                    echo "Build the Docker image"
                    docker build -t plato-image .
                    docker run -p 8080:80 plato-image
                    aws ecr get-login-password | docker login --username AWS --password-stdin $AWS_DOCKER_REGISTRY
                    docker push $AWS_DOCKER_REGISTRY/$APP_NAME:$REACT_APP_VERSION
                '''
                }
            }
        }
    }
}
