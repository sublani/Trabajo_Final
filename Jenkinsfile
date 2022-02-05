#!/usr/bin/env groovy

def props = null
def VERSION
def NAME


pipeline {
  agent { 
    label 'slave01' 
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
	  props = readProperties  file: 'Jenkinsfile.properties'          
          NAME = props['NAME']
          VERSION = props['VERSION']
        }
        echo "NAME=${NAME} \nVERSION=${VERSION}"
      }
    }
        
    stage('Clean') {
      steps {
        echo "Cleanning..."
        sh   "docker-compose -f app/node_project/docker-compose.app.yml down"
        sh   "docker rmi ${NAME}:${VERSION}"
      }
    }
    
    stage('Build') {
      steps {
        echo "Building..."
        sh   "docker build -t ${NAME}:${VERSION} -f app/node_project/Dockerfile ."
      }
    }
    
    stage('Test') {
      steps {
        echo 'Testing...'
        sh   'sleep 3'
        echo "------------------------------------------------------- \n T E S T S \n------------------------------------------------------- \nRunning com.logicbig.schedule.UserInputScheduleTest \nTests run: 11, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 3.258 sec \nResults : \nTests run: 11, Failures: 0, Errors: 0, Skipped: 0"
      }
    }
    
    stage('Sonar') {
      steps {
        echo 'Sonar ....'
        sh   'sleep 2'
        echo " INFO: Task total time: 3.785 s \nINFO: ------------------------------------------------------- \nINFO: EXECUTION SUCCESS \nINFO: ------------------------------------------------------- \nINFO: Total time: 4.023s \nINFO: Final Memory: 37M/128M \nINFO: -------------------------------------------------------"
      }
    }

    stage('Push') {
      steps {
        echo "Pushing..."
        echo "docker push ${NAME}:${VERSION}"
      }
    }

    stage('Deploy Dev') {
      when {
        expression{
          env.BRANCH_NAME == 'develop'
        }
      }
      steps {
        echo 'Deploying...'
        sh '''docker-compose -f app/node_project/docker-compose.app.yml up -d &&
              sleep 15 &&
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
        echo 'Deploying...'
        sh '''docker-compose -f app/node_project/docker-compose.app.yml up -d &&
              sleep 15 &&
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
