output "website_endpoint" {
  description = "O endpoint público do seu website estático no S3."
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}