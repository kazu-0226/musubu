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
end

