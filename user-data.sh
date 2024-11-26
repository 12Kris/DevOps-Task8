#!/bin/bash
set -x
yum -y update

yum -y install mc httpd dnf
dnf -y install openssl mod_ssl
sudo systemctl start httpd
sudo systemctl enable httpd

cat << EOF > /etc/ssl/site.info
[req]
prompt = no
distinguished_name = req_distinguished_name

[req_distinguished_name]
C = UA
ST = Lv
L = Lviv
O = IT-STEP University
OU = Lab8
CN = my-host.domain.com
emailAddress = mail@domain.com
EOF

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/pki/tls/private/apache-selfsigned.key \
-out /etc/pki/tls/certs/apache-selfsigned.crt \
-config /etc/ssl/site.info

# Перезапуск Apache
sudo systemctl restart httpd
