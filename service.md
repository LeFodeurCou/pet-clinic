/etc/systemd/system/petclinic.service

[Unit]
Description=PetClinic Spring Boot application service
[Service]
User=group1
ExecStart=java -jar /home/group1/spring-petclinic-2.5.0-SNAPSHOT.jar --server.port=8081
ExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target