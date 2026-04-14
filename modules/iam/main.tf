#############################################
# IAM ROLE PARA EC2
#############################################

resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-EC2-Role"

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

#############################################
# POLICY PARA S3
#############################################

resource "aws_iam_policy" "s3_policy" {
  name = "${var.project_name}-S3-Policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = ["s3:*"],
      Effect   = "Allow",
      Resource = "*"
    }]
  })
}

#############################################
# ANEXAR POLICY NA ROLE
#############################################

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

#############################################
# INSTANCE PROFILE (EC2 usa isso)
#############################################

resource "aws_iam_instance_profile" "profile" {
  name = "${var.project_name}-InstanceProfile"
  role = aws_iam_role.ec2_role.name
}