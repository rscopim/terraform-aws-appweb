data "aws_caller_identity" "current" {}

# IAM ROLE PARA EC2
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-EC2-Role"
  tags = merge(var.common_tags, {
    Name = "${var.project_name}-S3"
  })

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# POLICY PARA S3
resource "aws_iam_policy" "s3_policy" {
  name = "${var.project_name_safe}-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowListBucket"
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}"
      },
      {
        Sid    = "AllowReadWriteObjects"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-S3-Policy"
  })
}

# POLICY PARA SECRETS MANAGER
resource "aws_iam_policy" "secrets_policy" {
  name = "${var.project_name_safe}-secrets-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowReadRdsSecret"
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = "arn:aws:secretsmanager:us-west-2:${data.aws_caller_identity.current.account_id}:secret:rds!db-*"
      }
    ]
  })

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-Secrets-Policy"
  })
}

# ANEXAR POLICY NA ROLE

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "secrets_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.secrets_policy.arn
}

# INSTANCE PROFILE (EC2 usa isso)

resource "aws_iam_instance_profile" "profile" {
  name = "${var.project_name}-InstanceProfile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}