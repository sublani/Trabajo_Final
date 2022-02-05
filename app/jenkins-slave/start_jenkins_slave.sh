cd app/jenkins-slave
echo 2288a341f4a7fd0a01c9d4129ccbf236e05d04681d17795f8d4a9e55d5f1458f > secret-file
java -jar agent.jar -jnlpUrl http://192.168.0.25:7001/computer/slave01/jenkins-agent.jnlp -secret @secret-file -workDir "/opt/Trabajo_Final/app/jenkins-slave/workdir"
