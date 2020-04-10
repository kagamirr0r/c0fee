resource "aws_ecr_repository" "c0fee" {
  name = "c0fee"
}

resource "aws_ecr_lifecycle_policy" "c0fee" {
  repository = aws_ecr_repository.c0fee.name

  policy = <<EOF
	{
		"rules":[
			{
				"rulePriority":1,
				"description": "Keep last 10 release tagged images",
				"selection":{
					"tagStatus":"tagged",
					"tagPrefixList":["release"],
					"countType": "imageCountMoreThan",
					"countNumber":10
				},
				"action":{
					"type":"expire"
				}
			}
		]
	}
EOF
}

output "ecr_repository_url" {
  value = aws_ecr_repository.c0fee.repository_url
}
