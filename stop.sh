#JEnkinsfile

#docker build -t app:0.1.0 .

#pasa unos test

#despliega

#----------------

docker-compose -f ./app/mysql/docker-compose.mysql.yml down ;
docker-compose -f ./app/node_project/docker-compose.app.yml down ;
docker-compose -f ./app/jenkins/docker-compose.jenkins.yml down ;
docker-compose -f ./app/monitor/node-exporter/docker-compose.node-exporter.yml down ;

#----------------

kill -9 echo $(ps aux  | grep java | awk '{print $2}') ;
docker system prune -af

#----------------

