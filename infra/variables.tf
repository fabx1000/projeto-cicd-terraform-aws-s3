variable "bucket_name" {
  description = "Nome único global do bucket S3. Deve ser o mesmo da Secret BUCKET_NAME_TF."
  type        = string
}

variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados. Deve ser o mesmo da Secret AWS_REGION."
  type        = string
}