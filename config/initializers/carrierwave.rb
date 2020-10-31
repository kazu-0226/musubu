# CarrierWaveの設定呼び出し
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 画像名に日本語が使えるようにする
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

# 保存先の分岐
CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
  # if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'musubu-image-bucket'
    config.asset_host = 'https://s3.amazonaws.com/musubu-image-bucket'
    config.fog_public = false
    # iam_profile
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_kEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_kEY'],
      region: 'ap-northeast-1' #東京リージョン
    }
    # キャッシュをS3に保存
    # config.cache_storage = :fog
    else
    config.storage :file
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
  end  
end