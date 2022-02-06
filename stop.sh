#----------------

docker-compose -f ./app/mysql/docker-compose.mysql.yml down ;
docker-compose -f ./app/node_project/docker-compose.app.yml down ;
docker-compose -f ./app/jenkins/docker-compose.jenkins.yml down ;
docker-compose -f ./app/monitor/node-exporter/docker-compose.node-exporter.yml down ;
docker-compose -f ./app/monitor/prometheus/docker-compose.prometheus.yml down ;
docker-compose -f ./app/monitor/grafana/docker-compose.grafana.yml down ;
docker-compose -f ./app/monitor/alertmanager/docker-compose.alertmanager.yml down ;

#----------------

kill -9 echo $(ps aux  | grep java | awk '{print $2}') ;
docker system prune -af

#----------------

