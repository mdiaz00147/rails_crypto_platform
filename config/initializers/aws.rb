require 'aws-sdk'

unless Rails.env.test?
  Aws.config.update({
    region: 'us-east-1',
    credentials: Aws::Credentials.new(Rails.application.secrets.aws_access_key_id, Rails.application.secrets.aws_secret_access_key),
  })

  S3_CLIENT = Aws::S3::Client.new
  S3_BUCKET = Aws::S3::Resource.new.bucket(Rails.application.secrets.aws_bucket_name)
  S3_PRESIGNER = Aws::S3::Presigner.new
end