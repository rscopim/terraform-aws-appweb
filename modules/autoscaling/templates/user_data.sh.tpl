#!/bin/bash

yum update -y
yum install -y httpd aws-cli

systemctl start httpd
systemctl enable httpd

HOSTNAME=$(hostname)
BUCKET_NAME="${bucket_name}"
MESSAGE_FILE="/tmp/app-message.txt"
S3_KEY="app/message.txt"

echo "Mensagem criada pela instancia $HOSTNAME em $(date)" > $MESSAGE_FILE

aws s3 cp $MESSAGE_FILE s3://$BUCKET_NAME/$S3_KEY

aws s3 cp s3://$BUCKET_NAME/$S3_KEY /tmp/message-from-s3.txt

MESSAGE_FROM_S3=$(cat /tmp/message-from-s3.txt)

cat <<EOF_HTML > /var/www/html/index.html
${html_content}
EOF_HTML

sed -i "s|S3_MESSAGE_PLACEHOLDER|$MESSAGE_FROM_S3|g" /var/www/html/index.html

cat <<EOF_CSS > /var/www/html/style.css
${css_content}
EOF_CSS