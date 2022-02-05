#!/usr/bin/env groovy

def props = null
def VERSION
def NAME


pipeline {
    agent { 
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
	
	stage('Enviroment'){
            steps{
		script {
		    if (!fileExists('Jenkinsfile.properties')){
			exit
		    }
		    props = readProperties file:'Jenkinsfile.properties'
  		    NAME = props['NAME']
                    VERSION = props['VERSION']
		}
	    }
	}
        
        stage('Clean') {
            steps {
                echo 'Cleanning..'
                sh '''sudo docker-compose -f app/node_project/docker-compose.app.yml down ;
                      sudo docker rmi ${NAME}:${VERSION} ;
                '''
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building..'
                sh '''sudo docker build -t ${NAME}:${VERSION} -f app/node_project/Dockerfile .
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'

                sh   'sleep 3'

                echo '-------------------------------------------------------'
		echo ' T E S T S'
		echo '-------------------------------------------------------'
		echo 'Running com.logicbig.schedule.UserInputScheduleTest'
		echo 'Tests run: 11, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 3.258 sec'
		echo 'Results :'
		echo 'Tests run: 11, Failures: 0, Errors: 0, Skipped: 0 '''
            }
        }
        
        stage('Sonar') {
            steps {
                echo 'Sonar ....'

		sh   'sleep 2'
		
                echo 'INFO: Task total time: 3.785 s'
    		echo 'INFO: -------------------------------------------------------'
		echo 'INFO: EXECUTION SUCCESS'
		echo 'INFO: -------------------------------------------------------'
                echo 'INFO: Total time: 4.023s'
                echo 'INFO: Final Memory: 37M/128M'
                echo 'INFO: -------------------------------------------------------'
            }
        }

	stage('Push') {
            steps {
                echo 'Pushing....'
		echo 'sudo docker push ${NAME}:${VERSION}'
            }
        }

        stage('Deploy Dev') {
            when {
                expression{
	  	  env.BRANCH_NAME == 'develop'
                }
            }
            steps {
                echo 'Deploying....'
                sh '''sudo docker-compose -f app/node_project/docker-compose.app.yml up -d &&
                      sudo sleep 15 &&
                      wget http://192.168.0.25:3000/
                '''
            }
        } 
        stage('Deploy PRE') {
            when {
                expression{
                  env.BRANCH_NAME == 'master'
                }
            }
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
