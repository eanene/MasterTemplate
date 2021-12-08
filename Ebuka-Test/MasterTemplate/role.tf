resource "aws_iam_role" "ec2_s3_role" {
    name = "ec2_s3_full_access_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
      "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "instace_profile" {
    name = "ec2_instance_profile"
    role = aws_iam_role.ec2_s3_role.name
}

resource "aws_iam_role_policy" "s3_full_access" {
  name = "s3_full_access_policy"
  role = aws_iam_role.ec2_s3_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

