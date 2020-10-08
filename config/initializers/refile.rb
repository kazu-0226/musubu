require "refile/s3"

aws = {
  access_key_id: ENV['ACCESS_kEY_ID'],
  secret_access_key: ENV['SECRET_ACCESS_kEY'],
  region: "ap-northeast-1",
  bucket: "musubu-image-bucket",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)