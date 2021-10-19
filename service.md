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

[Unit]
Description=PetClinic Spring Boot application service on docker
After=d-mysql@group1.service
Requires=d-mysql@group1.service

[Service]
User=group1
ExecStart=docker run --rm -p 8080:8080 --network pet-clinic --name pet-clinic-group1 lefodeurcou.jfrog.io/pet-clinic/pet-clinic
ExecStop=docker stop pet-clinic-group1
ExitStatus=143
TimeoutStopSec=10
Restart=on-failure
RestartSec=5
[Install]
WantedBy=multi-user.target