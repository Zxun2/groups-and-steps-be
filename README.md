# CVWO Riding on Rails 2021/2022 - 📝 [Groups and Steps](https://cvwo-groups-and-steps-ts.netlify.app/)

<div id="#top"></div>

Frontend Repo: <https://github.com/Zxun2/cvwo-assignment-frontend>

Backend Repo: <https://github.com/Zxun2/cvwo-assignment-backend>

|     Name     | Matriculation Number |
| :----------: | :------------------: |
| Lee Zong Xun |      A0233594Y       |

### Tutorial account details for Web app (Recommended)

|       Email        | Password |
| :----------------: | :------: |
| tutorial@gmail.com |  foobar  |

## Overview

Groups and Steps 📝 is a web application built using Rails and React for CVWO 2021/2022 assignment. It allows you to manage your tasks into groups, and further break them down into steps.

### Features to look out for

1. Tags to categorise your steps
2. Notification system
3. User profile
4. Search functionality
5. Deadlines

## Setting up

### Frontend

#### Running Frontend Development Server on Docker

```bash
docker-compose -f docker-compose.yaml -f docker-compose-dev.yaml up -d --build
```

#### Running Frontend Production Server on Docker

```bash
docker-compose -f docker-compose.yaml -f docker-compose-prod.yaml up -d --build
```

### Backend

#### Running Backend Development Server on Docker

```bash
# Build image
docker-compose build

# Set up database
docker-compose run web bundle exec rails db:create
docker-compose run web bundle exec rails db:migrate

# Rebuild any modified images and run in detached mode
docker-compose up --build -d
```

#### Backend Troubleshoot

```bash
Error starting userland proxy: listen tcp 0.0.0.0:5432: bind: address already in use
```

Reason: Port 5432 is already in use on local machine. This is most likely that there is another PostgreSQL server running locally.

Solution: Either stop the PostgreSQL on local machine or map to another port in docker-compose.yml, like - '5434:5432'.

```bash
Your Ruby version is 2.6.5, but your Gemfile specified 3.0.3
ERROR: Service 'web' failed to build: The command '/bin/sh -c bundle install' returned a non-zero code: 18
```

Reason: There is a Ruby version mismatch between Gemfile and Docker container.

Solution: Either update the Ruby version in Gemfile to 2.6.5, or pull explicitly Ruby 3.0.3 image in Dockerfile like FROM ruby:3.0.3-alpine.

```bash
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json: dial unix /var/run/docker.sock: connect: permission denied
```

Solution:

```bash
# Restart docker
sudo systemctl restart docker

# Create docker group
sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker ${USER}

# Relogin
su - ${USER}
```

### Shutting down server

```bash
# Removes running containers
docker-compose down
```

## General Docker Troubleshooting

```bash
# Removes all inactive images
docker image prune -a

# Removes all inactive containers
docker ps prune -a

# Removes all inactive networks
docker network prune -a
```

## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request.

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#top">Back to top</a>)</p>
