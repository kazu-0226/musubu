class ShopsController < ApplicationController
  before_action :authenticate_shop!
  before_action :set_shop, only: [:show, :edit, :update, :withdraw]

  def show
  end

  def edit
    @categories = g_category['category_l']
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def index
    @shops= Shop.all    
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
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :name_kana, :post_code, :prefecture_code, :city, :block, :building, :phone_number,:email, :category, :catchcopy, :main_image, :sub_image, :appeal_text, :appeal_image, :recommend_name, :recommend_text, :recommend_image, :is_deleted)
  end

end
