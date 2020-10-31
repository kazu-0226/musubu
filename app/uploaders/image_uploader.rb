class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # developmentとtest以外はS3を使用
  if Rails.env.development? || Rails.env.test? 
    storage :file
  else
    storage :fog
  end

  # 画像ごとに保存するディレクトリを変える
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/#{mounted_as}"
  end

  # 許可する画像の拡張子
  def extension_whitelist
     %w(jpg jpeg gif png)
  end

  # ファイル名を書き換える
  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.#{file.extension}" if original_filename
  end
end