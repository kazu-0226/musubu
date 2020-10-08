require "refile/s3"

aws = {
  access_key_id: ENV['ACCESS_kEY_ID'],
  secret_access_key: ENV['SECRET_ACCESS_kEY'],
  region: "sa-east-1",
  bucket: "my-bucket",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)