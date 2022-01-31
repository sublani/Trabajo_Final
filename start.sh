JEnkinsfile

docker build -t app:0.1.0 .

pasa unos test

despliega

-------


docker network create app

docker-compose -f ./app/mysql/docker-compose.mysql.yml up -d

docker-compose -f ./app/node_project/docker-compose.app.yml up -d

docker-compose -f ./app/jenkins/docker-compose.jenkins.yml up -d

--------
docker-compose -f ./app/mysql/docker-compose.mysql.yml down ;
docker-compose -f ./app/node_project/docker-compose.app.yml down ;
docker-compose -f ./app/jenkins/docker-compose.jenkins.yml down
