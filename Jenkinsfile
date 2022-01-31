pipeline {
    agent any
    
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        disableConcurrentBuilds()
        properties([
            pipelineTriggers([
                githubPush()
            ])
        ])
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    
    post {
        failure {
            sh 'echo "Envía correo; mail to: team@example.com, subject: \'The Pipeline failed :(\''
        }
    }
}