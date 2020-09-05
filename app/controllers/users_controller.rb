class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :withdraw]

  def show
  end

  def edit
    @categories = g_category['category_l']
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def index
    @users = User.all
  end

  def search
    
  end

  def withdraw
    
  end

  def g_category
    #requireメソッドで下記のライブラリを読み込む
    require 'net/http'
    require 'uri'
    require 'json'
    
    #URIライブラリを用いて、URLの文字列をURIオブジェクトへと生成してuriに代入（parse)
    uri = URI.parse("https://api.gnavi.co.jp/master/CategoryLargeSearchAPI/v3/?keyid=#{ENV['GNAVI_API_KEY']}")
    #Net::HTTPライブラリを用いて、URIにgetリクエストを送り、jsonへ代入
    json = Net::HTTP.get(uri)
    #上記で取得したjsonをJSONとして解析してresultへ代入
    result = JSON.parse(json)
    # result["category_l"].each do |code|
    # puts code["category_l_code"]
    #end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :prefecture_code, :phone_number, :email, :hope_perfecture_code, :hope_category, :personality, :user_image, :pr )
  end
end
