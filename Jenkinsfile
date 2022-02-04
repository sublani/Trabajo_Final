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
        
        stage('Clean') {
            steps {
                echo 'Cleanning..'
                sh '''sudo docker-compose -f app/node_project/docker-compose.app.yml down ;
                      sudo docker rmi app:0.1.0-SNAPSHOT;
                '''
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''sudo docker build -t app:0.1.0-SNAPSHOT -f app/node_project/Dockerfile .
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                /*sh '''sudo sleep 15 &&
                      wget http://192.168.0.25:3000/
                '''*/
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh '''sudo docker-compose -f app/node_project/docker-compose.app.yml up -d &&
                      sudo sleep 15 &&
                      wget http://192.168.0.25:3000/
                '''
            }
        }
    }
    
    post {
        failure {
            sh 'echo "Envía correo; mail to: team@example.com, subject: \'The Pipeline failed :(\''
        }
    }
}
