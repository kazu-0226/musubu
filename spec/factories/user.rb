FactoryBot.define do
    factory :user do
      first_name { Faker::Lorem.characters(number:4) }
      last_name { Faker::Lorem.characters(number:2) }
      first_name_kana { Faker::Lorem.characters(number:4) }
      last_name_kana { Faker::Lorem.characters(number:2) }
      prefecture_code ="1"
      phone_number ="090-0000-0000"
      personality ="true"
      category_id ="1"
      hope_prefecture_code ="1"
      pr { Faker::Lorem.characters(number:30) }
      is_deleted = false
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end