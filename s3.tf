data "aws_kms_key" "s3_key" {
  key_id = "alias/aws/s3"
}

resource "aws_s3_bucket" "test" {
        bucket = "${var.bucket_name[0]}"

        versioning {
                enabled = true
        }
        acl = "private"

        tags = {
                Name = "${var.bucket_name[0]}"
        }
		
		server_side_encryption_configuration {
			rule {
			apply_server_side_encryption_by_default {
			kms_master_key_id = data.aws_kms_key.s3_key.arn
			sse_algorithm     = "aws:kms"
      }
    }
  }
}

        resource "aws_s3_bucket_public_access_block" "example" {
                bucket = aws_s3_bucket.test.id

                block_public_acls   = true
                block_public_policy = true
                ignore_public_acls = true
                restrict_public_buckets = true
        }


        resource "aws_s3_bucket_policy" "b" {
                bucket = aws_s3_bucket.test.id

                policy = <<EOF
{
                        "Id": "Policy1608122684169",
                        "Version": "2012-10-17",
                        "Statement": [
                        {
                                "Sid": "Stmt1608122682748",
                                "Action": "s3:*",
                                "Effect": "Allow",
                                "Resource": "arn:aws:s3:::${var.bucket_name[0]}",
                                "Principal": {
                                "AWS": [
                                        "arn:aws:iam::536530634742:user/cloud_user"
                                        ]
                                }
                        }
                ]
        }
        EOF
        }
