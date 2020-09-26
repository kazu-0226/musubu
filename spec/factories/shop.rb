FactoryBot.define do
    factory :shop do
      name { Faker::Lorem.characters(number:10) }
      name_kana{ Faker::Lorem.characters(number:10) }
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { 'password' }
      post_code ="102-0094"
      prefecture_code ="13"
      city ="千代田区紀尾井町"
      block ="3-23"
      building ="文藝春秋ビル新館"
      phone_number ="090-0000-0000"
      category_id ="1"
      catchcopy ="丁寧な料理とおもてなし！"
      appeal_text ="この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。"
      recommend_name ="この文章はダミーです。文字の大"
      recommend_text ="この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大"
      is_deleted ="FALSE"
    end
  end