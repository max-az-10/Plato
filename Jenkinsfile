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

    tools {
        maven 'maven3'  // Specify your Maven version
    }

    stages {
        stage('Checkout GitHub Code') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-cred', poll: false, url: 'https://github.com/max-az-10/Plato.git'
            }
        }
        stage('Code compile') {
            steps {
                script {
                    // Compile the project without packaging or testing
                    echo 'Compiling the project...'
                    sh 'mvn clean compile -DskipTests=true'  // This will clean and compile the source code
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Clean and build the project using Maven
                    echo 'Building the project...'
                    sh 'mvn clean install'  // This will clean and build the project
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run unit tests with Maven
                    echo 'Running tests...'
                    sh 'mvn test'  // Run the tests
                }
            }
        }
    }
}
