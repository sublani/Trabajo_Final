pipeline {
    agent { 
        node { 
            label 'slave01' 
        } 
    }  
    
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
        /*
        stage('Clean') {
            steps {
                echo 'Cleanning..'
                sh '''sudo docker-compose -f /opt/Trabajo_Final/app/node_project/docker-compose.app.yml down ;
                      sudo docker rmi app:0.1.0-SNAPSHOT;
                '''
            }
        }*/
        
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''echo "docker build -t app:0.1.0-SNAPSHOT ." &&
                      sudo docker build -t app:0.1.0-SNAPSHOT -f app/node_project/Dockerfile . &&
                      sudo docker-compose -f /opt/Trabajo_Final/app/node_project/docker-compose.app.yml up
                '''
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
