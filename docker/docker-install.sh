#!/bin/bash
# centos7

# install docker
docker_install() {
  yum install -y yum-utils device-mapper-persistent-data lvm2
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  yum install -y docker-ce
  systemctl start docker
  systemctl enable docker
}

# install docker-compose
docker_compose_install() {
  ver=1.25.5
  curl -L https://github.com/docker/compose/releases/download/${ver}/docker-compose-`uname -s`-`uname -m` > /bin/docker-compose
  chmod +x /bin/docker-compose
}

docker_install
docker_compose_install
