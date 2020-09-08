class Admins::ShopsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_shop, only: [:show, :edit, :update]

    def index
        @shops = Shop.all.order(id: "DESC").page(params[:page]).per(10)
    end

    def show
        
    end

    def edit
        
    end

    def update
        if @shop.update(shop_params)
            redirect_to admins_shop_path(@shop)
        else
            render :edit
        end 
    end

    #ぐるなびAPIからカテゴリを作成
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
        result['category_l'].each { |row|
          Category.new(name: row['category_l_name'], code: row['category_l_code']).save
         }
    end

    private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
        params.require(:shop).permit(:name, :name_kana, :post_code, :prefecture_code, :city, :block, :building, :phone_number,:email, :category_id, :catchcopy, :main_image, :sub_image, :appeal_text, :appeal_image, :recommend_name, :recommend_text, :recommend_image, :is_deleted)
      end
    
end
