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
    aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    secret_key_base: Rails.application.credentials.aws[:secret_key_base],
    region: 'ap-northeast-1'
  }
  config.fog_directory  = 'mercariteambbucket'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercariteambbucket'
  end
end

