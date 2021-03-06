require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
# 開発環境ではローカルに保存
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
# 本番はS3に保存
  elsif Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:  ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: 'ap-northeast-1'
  }
  config.fog_directory  = 'mercariteambbucket'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercariteambbucket'
  end
end

