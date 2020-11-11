FactoryBot.define do
  factory :news do
    news_image_id { "MyString" }
    title { "MyString" }
    content { "MyText" }
    start_date { "2020-11-11" }
    end_date { "2020-11-11" }
    open_status { false }
  end
end
