#!/bin/bash

yum update -y
yum install -y httpd aws-cli

systemctl start httpd
systemctl enable httpd

HOSTNAME=$(hostname)

cat <<EOF_HTML > /var/www/html/index.html
${html_content}
EOF_HTML

cat <<EOF_CSS > /var/www/html/style.css
${css_content}
EOF_CSS