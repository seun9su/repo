#!/bin/bash

# step1 : docker 설치

# step2 : docker-compose 설치

# step3 : harbor 파일 다운로드 및 압축 해제
curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '\.tgz$' | grep 'offline' | wget -qi 
tar xvzf harbor-offline-installer*.tgz

# step4: harbor.yml 세팅
# hostname, certificate, password, 기타 수정

# step5: 설치
#./install.sh --with-notary --with-clair --with-chartmuseum

# 번외 : 재시작
#docker-compose up -d
#docker-compose down -v

# 번외 : reverse proxy 세팅
#upstream harborService {
#  server 0.0.0.0:443;
#}
#
#server {
#  listen 80;
#  listen 443 ssl;
#  server_name harbor.domain.com;
#
#  ssl_certificate /etc/nginx/cert/harbor.domain.com.pem
#  ssl_certificate /etc/nginx/cert/harbor.domain.com.key
#
#  client_max_body_size 500M;
#
#  if ($scheme = http) {
#    return 301 https://$server_name$request_uri;
#  }
#
#  location / {
#    proxy_set_header Host $http_host;
#    proxy_set_header X-Real-IP $remote_addr;
#    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#    proxy_set_header X-Forwarded-Proto $scheme;
#    proxy_pass https://harborService/;
#    proxy_buffering off;
#    proxy_request_buffering off;
#  }

# 번외 : ldap 연동
#LDAP URL : ldap://xldap.domain.com
#LDAP Search DN : cn=Directory Manager
#LDAP Search Password : ****
#LDAP Base DN : dc=domain,dc=com
#LDAP UID : uid
#LDAP Group Membership : memberof
