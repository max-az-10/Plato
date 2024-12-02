pipeline {
    agent any

    stages {
        stage('Checkout GitHub Code') {
            steps {
                git branch: 'main', changelog: false, credentialsId: 'Git-cred', poll: false, url: 'https://github.com/max-az-10/Plato.git'
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
