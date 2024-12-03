pipeline {
    agent any

    environment {
        //REACT_APP_VERSION = "1.0.$BUILD_ID"
        //APP_NAME = 'planoApp'       
        AWS_DEFAULT_REGION = 'us-west-2'
        AWS_DOCKER_REGISTRY = '381492139836.dkr.ecr.us-west-2.amazonaws.com/plato-repo'
        AWS_ECS_CLUSTER = 'PlanoApp-Cluster'
        AWS_ECS_SERVICE = 'PlatoApp-Service'
        AWS_ECS_TD = 'PlatoApp-TaskDefinition'
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
                    // some block
                sh '''
                    echo "Build the Docker image"
                '''
            }
        }
    }
}
