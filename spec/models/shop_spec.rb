require 'rails_helper'

RSpec.describe Shop, type: :model do
  context "データが正しく保存される" do
    before do
      @shop = Shop.new
      @shop.email ="1@1"
      @shop.password ="qazwsx"
      @shop.name ="和食 結"
      @shop.name_kana ="ワショクユイ"
      @shop.post_code ="102-0094"
      @shop.prefecture_code ="13"
      @shop.city ="千代田区紀尾井町"
      @shop.block ="3-23"
      @shop.building ="文藝春秋ビル新館"
      @shop.phone_number ="090-0000-0000"
      @shop.category_id ="1"
      @shop.catchcopy ="丁寧な料理とおもてなし！"
      @shop.appeal_text ="この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。"
      @shop.recommend_name ="この文章はダミーです。文字の大"
      @shop.recommend_text ="この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大"
      @shop.is_deleted ="FALSE"
    end
    it "全て入力してあるので保存される" do
      expect(@shop).to be_valid
    end
  end
end
