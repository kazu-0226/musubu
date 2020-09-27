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

  context 'カラムが空の場合のテスト' do
    let(:test_shop) { create :shop }
    it 'emai' do
      test_shop.email = ""
      expect(test_shop.invalid?).to be true
    end
    it 'name' do
      test_shop.name = ""
      expect(test_shop.invalid?).to be true
    end
    it 'name_kana' do
      test_shop.name_kana = ""
      expect(test_shop.invalid?).to be true
    end
    it 'appeal_text' do
      test_shop.post_code = ""
      expect(test_shop.invalid?).to be true
    end
    it 'prefecture_code' do
      test_shop.prefecture_code = ""
      expect(test_shop.invalid?).to be true
    end
    it 'city' do
      test_shop.city = ""
      expect(test_shop.invalid?).to be true
    end
    it 'block' do
      test_shop.block = ""
      expect(test_shop.invalid?).to be true
    end
    it 'building' do
      test_shop.building = ""
      expect(test_shop.invalid?).to be true
    end
    it 'phone_number' do
      test_shop.phone_number = ""
      expect(test_shop.invalid?).to be true
    end
    it 'category_id' do
      test_shop.category_id = ""
      expect(test_shop.invalid?).to be true
    end
    it 'catchcopy' do
      test_shop.catchcopy = ""
      expect(test_shop.invalid?).to be true
    end
    it 'appeal_text' do
      test_shop.appeal_text = ""
      expect(test_shop.invalid?).to be true
    end
    it 'recommend_name' do
      test_shop.recommend_name = ""
      expect(test_shop.invalid?).to be true
    end
    it 'recommend_text' do
      test_shop.recommend_text = ""
      expect(test_shop.invalid?).to be true
    end
    it 'is_deleted' do
      test_shop.is_deleted = ""
      expect(test_shop.invalid?).to be true
    end
  end

  
  context '入力上限のテスト' do
    let(:test_shop) { create :shop }
    it '250文字以下であること' do
      test_shop.appeal_text = Faker::Lorem.characters(number:251)
      expect(test_shop.invalid?).to be true
    end
    it '220文字以下であること' do
      test_shop.recommend_text = Faker::Lorem.characters(number:221)
      expect(test_shop.invalid?).to be true
    end
    it '15文字以下であること' do
      test_shop.recommend_name = Faker::Lorem.characters(number:16)
      expect(test_shop.invalid?).to be true
    end
  end

  context "メールアドレス" do
    let(:test_shop) { build :shop }
    it "一意性が正しく機能しているか" do
      duplicate_shop = test_shop.dup
      duplicate_shop.email =test_shop.email.upcase
      test_shop.save!
      expect(duplicate_shop).to be_invalid
    end
  end

  context 'passwordのテスト' do
    let(:test_shop) { create :shop }
    it '６文字以上であること' do
      test_shop.password = Faker::Lorem.characters(number:5)
      expect(test_shop.invalid?).to be true
    end
  end

end