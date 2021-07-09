{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
            	"ec2:*",
			    "route53:*",
                "dynamodb:*",
                "lightsail:*",
                "amplify:*",
                "cloudfront:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": "arn:aws:s3:::$${var.bucket_name}"
        }
    ]
}