class ProfileUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
    "sample.jpg"
  end

  process resize_to_limit: [ 800, 800 ]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [ 50, 50 ]
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_allowlist
    %w[jpg jpeg gif png]
  end

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
end
