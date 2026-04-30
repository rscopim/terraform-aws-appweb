#!/bin/bash

yum update -y
yum install -y httpd aws-cli

systemctl start httpd
systemctl enable httpd

HOSTNAME=$(hostname)
DEPLOY_TIME=$(date -u +"%Y-%m-%d %H:%M:%S UTC")

BUCKET_NAME="${bucket_name}"
MESSAGE_FILE="/tmp/app-message.txt"
S3_KEY="app/message.txt"

echo "Mensagem criada pela instancia $HOSTNAME em $DEPLOY_TIME" > $MESSAGE_FILE

aws s3 cp $MESSAGE_FILE s3://$BUCKET_NAME/$S3_KEY
aws s3 cp s3://$BUCKET_NAME/$S3_KEY /tmp/message-from-s3.txt

MESSAGE_FROM_S3=$(cat /tmp/message-from-s3.txt)

RDS_SECRET_ARN="${rds_secret_arn}"

SECRET_JSON=$(aws secretsmanager get-secret-value \
  --secret-id "$RDS_SECRET_ARN" \
  --query SecretString \
  --output text 2>/tmp/secrets-error.log)

if [ $? -eq 0 ] && [ -n "$SECRET_JSON" ]; then
  RDS_USER=$(python3 -c "import json; print(json.loads('''$SECRET_JSON''').get('username', 'usuario-nao-encontrado'))")
  SECRET_STATUS="Secret lido com sucesso pelo Secrets Manager"
else
  RDS_USER="Nao foi possivel ler o usuario"
  SECRET_STATUS="Falha ao ler secret. Verifique IAM Role e permissoes."
fi

cat <<EOF_HTML > /var/www/html/index.html
${html_content}
EOF_HTML

sed -i "s|INSTANCE_HOSTNAME_PLACEHOLDER|$HOSTNAME|g" /var/www/html/index.html
sed -i "s|DEPLOY_TIME_PLACEHOLDER|$DEPLOY_TIME|g" /var/www/html/index.html
sed -i "s|S3_MESSAGE_PLACEHOLDER|$MESSAGE_FROM_S3|g" /var/www/html/index.html
sed -i "s|RDS_USER_PLACEHOLDER|$RDS_USER|g" /var/www/html/index.html
sed -i "s|SECRET_STATUS_PLACEHOLDER|$SECRET_STATUS|g" /var/www/html/index.html

cat <<EOF_CSS > /var/www/html/style.css
${css_content}
EOF_CSS