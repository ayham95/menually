CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.aws_credentials = {
        access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
        secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        region: ENV.fetch('AWS_REGION'), # Required
        stub_responses: Rails.env.test? # Optional, avoid hitting S3 actual during tests
    }
    config.storage = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end