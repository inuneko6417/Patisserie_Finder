require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.ci?
    config.storage :file
    config.enable_processing = false
  else
    config.storage :fog
    config.fog_directory  = ENV["AWS_BUCKET_NAME"]
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: ENV["AWS_REGION"],
      path_style: true
    }
  end
end
