require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    before do 
     @user= User.new
     @user.email ="1@1"
     @user.password ="qazwsx"
     @user.first_name ="伊都子"
     @user.last_name ="川合"
     @user.first_name_kana ="イツコ"
     @user.last_name_kana ="カワイ"
     @user.prefecture_code ="1"
     @user.phone_number ="090-0000-0000"
     @user.personality ="true"
     @user.category_id ="1"
     @user.hope_prefecture_code ="1"
     @user.pr ="この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。"
     @user.is_deleted ="FALSE"
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
    end
  end

  context 'カラムが空の場合のテスト' do
    let(:test_user) { create :user }
    it 'emai' do
      test_user.email = ""
      expect(test_user.invalid?).to be true
    end
    it 'first_name' do
      test_user.first_name = ""
      expect(test_user.invalid?).to be true
    end
    it 'last_name' do
      test_user.last_name = ""
      expect(test_user.invalid?).to be true
    end
    it 'first_name_kana' do
      test_user.first_name_kana = ""
      expect(test_user.invalid?).to be true
    end
    it 'last_name_kana' do
      test_user.last_name_kana = ""
      expect(test_user.invalid?).to be true
    end
    it 'prefecture_code' do
      test_user.prefecture_code = ""
      expect(test_user.invalid?).to be true
    end
    it 'phone_number' do
      test_user.phone_number = ""
      expect(test_user.invalid?).to be true
    end
    it 'personality' do
      test_user.phone_number = ""
      expect(test_user.invalid?).to be true
    end
    it 'category_id' do
      test_user.category_id = ""
      expect(test_user.invalid?).to be true
    end
    it 'hope_prefecture_code' do
      test_user.hope_prefecture_code = ""
      expect(test_user.invalid?).to be true
    end
    it 'pr' do
      test_user.pr = ""
      expect(test_user.invalid?).to be true
    end
    it 'is_deleted' do
      test_user.is_deleted = ""
      expect(test_user.invalid?).to be true
    end
  end

  context "メールアドレス" do
    let(:test_user) { build :user }
    it "一意性が正しく機能しているか" do
      duplicate_user = test_user.dup
      duplicate_user.email =test_user.email.upcase
      test_user.save!
      expect(duplicate_user).to be_invalid
    end
  end

  context 'passwordのテスト' do
    let(:test_user) { create :user }
    it '６文字以上であること' do
      test_user.password = Faker::Lorem.characters(number:5)
      expect(test_user.invalid?).to be true
    end
  end

  context 'full_name_kanaのテスト' do
    let(:test_user) { create :user }
    it '生成される名前' do
      test_user.first_name_kana = "アアア" 
      test_user.last_name_kana = "イイイ" 
      expect(test_user.full_name_kana).to eq "イイイアアア"
    end
  end


end

