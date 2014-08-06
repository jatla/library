require 'fog/aws/storage'
require 'carrierwave'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],        # required
    :region                 => ENV["AWS_REGION"],            # optional, defaults to 'us-east-1'
    :endpoint               => 'https://s3-us-west-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'book-images-library'                   # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.fog_use_ssl_for_aws = true
end