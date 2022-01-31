pipeline {
    agent any
    
    stages {
        stage('Setup parameters') {
            steps {
                script { 
                    properties([
                        buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5')), 
                        disableConcurrentBuilds(), 
                        pipelineTriggers([githubPush()])
                    ])
                }
            }
        }
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