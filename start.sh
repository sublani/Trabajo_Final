#JEnkinsfile

#docker build -t app:0.1.0 .

#pasa unos test

#despliega

#----------------

docker network create app ;

docker-compose -f ./app/mysql/docker-compose.mysql.yml up -d ;

sudo docker build -t app:0.1.0-SNAPSHOT -f app/node_project/Dockerfile .

docker-compose -f ./app/node_project/docker-compose.app.yml up -d ;

docker-compose -f ./app/jenkins/docker-compose.jenkins.yml up -d ;

docker-compose -f ./app/monitor/node-exporter/docker-compose.node-exporter.yml up -d ;

docker-compose -f ./app/monitor/prometheus/docker-compose.prometheus.yml up -d ;

sleep 15;

docker-compose -f ./app/monitor/grafana/docker-compose.grafana.yml up -d ;

docker-compose -f ./app/monitor/alertmanager/docker-compose.alertmanager.yml up -d ;

docker-compose -f ./app/monitor/elasticsearch/docker-compose.elasticsearch.yml up -d ;

docker-compose -f ./app/monitor/logstash/docker-compose.logstash.yml up -d ;

docker-compose -f ./app/monitor/kibana/docker-compose.kibana.yml up -d ;

#----------------

sleep 30 ;

#----------------

nohup /opt/Trabajo_Final/app/jenkins-slave/start_jenkins_slave.sh &

#----------------
