#JEnkinsfile

#docker build -t app:0.1.0 .

#pasa unos test

#despliega

#----------------

docker-compose -f ./app/mysql/docker-compose.mysql.yml down ;
docker-compose -f ./app/node_project/docker-compose.app.yml down ;
docker-compose -f ./app/jenkins/docker-compose.jenkins.yml down ;

#----------------

docker system prune -af

#----------------
