terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuração do Provedor AWS
provider "aws" {
  region = var.aws_region
}

# Recurso 1: Criação do Bucket S3
resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name
  tags = {
    Name = "Static Website Bucket - ${var.bucket_name}"
  }
}

# Recurso 2: Garante que o bucket pode ser configurado para acesso público de website
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.static_website.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# Recurso 3: Define o bucket como hospedagem de site estático
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.static_website.id
  index_document {
    suffix = "index.html"
  }
}

# Recurso 4: Política de Bucket para permitir acesso de leitura público (s3:GetObject)
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Sid"    = "PublicReadGetObject",
        "Effect" = "Allow",
        "Principal" = "*",
        "Action" = "s3:GetObject",
        "Resource" = [
          "${aws_s3_bucket.static_website.arn}/*",
        ]
      }
    ]
  })
}
