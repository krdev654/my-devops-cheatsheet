## Pull the docker image

```
docker pull <<Image Name>> e.g docker pull sonarqube
```

## Run Docker Image

```
docker run -d --name sonarqube -p 9000:9000 sonarqube:latest (-d In background, --name associate name for the container)
docker run --name sonarqube -p 9000:9000 sonarqube:latest
docker run --rm --name sonarqube -p 9000:9000 -e SONARQUBE_ADMIN_PASSWORD="Welcome1" techforum/sonarqube-with-custom-plugins-aem:latest(--rm remove existing container,-e SONARQUBE_ADMIN_PASSWORD="Welcome1" environment variable) 
docker run --rm --name sonarqube -p 9000:9000 -v /mnt/c/Albin/blogData/docker-container-files/data:/opt/sonarqube/data -v /mnt/c/Albin/blogData/docker-container-files/logs:/opt/sonarqube/logs -e SONARQUBE_ADMIN_PASSWORD="Welcome1" techforum/sonarqube-with-custom-plugins-aem:latest (-v volume mapping, map docker volume to host folder)
```

## Push Image to Docker Hub

```
docker push techforum/sonarqube-with-custom-plugins-aem:latest
```

## List out the active containers

```
docker ps -a 
docker ps -a -f name=sonarqube(container with specific name)
```

## Restart container

```
docker container restart sonarqube
```

## Stop Container

```
docker container stop sonarqube
```

## Restart Container

```
docker container restart sonarqube
```

## Start Container

```
docker container start sonarqube
```

## Verify Container Logs

```
docker logs sonarqube
```

## Run multi container application (execute the docker compose comands from the folder where docker-compose.yml file is stored)

```
docker-compose up
docker-compose up -d  (-d run the containers in background)
```

### Stop the Containers

```
docker-compose stop
```

### Start the Containers

```
docker-compose start
```

### View Docker Composer Logs

```
docker-compose logs -f (-f displays the current logs)
```

## List the volumes

```
docker volume ls
```

## Remove Volume

```
docker volume rm -f <Volume Name>
```

## Inspect Volumes

```
docker inspect <Volume Name>
docker inspect --format="{{.Mounts}}" <Container Name>
docker inspect <Volume Name> | grep Mountpoint | awk '{ print $2 }'
```

## Execute Commands inside running container

```
docker exec -it <Container Id> /bin/bash  (execute the the commands in the bash shell)
```
