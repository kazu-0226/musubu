class ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :withdraw]
  before_action :set_shop, only: [:show, :edit, :update, :withdraw, :followers, :followings ]

  def show
    #ユーザが店舗詳細にてチャットを開始するため、ユーザがログインしていることが条件
    if user_signed_in?
      #お店と会員のチャットルームをeachで一つずつ取り出す
      current_user.chat_rooms.each do |cur|
        @shop.chat_rooms.each do |sr|
          #お店と会員のルームIDが等しければすでにルームは作成済みのため、@isRoom = trueとして@roomId = cur.idを代入
          if cur.id == sr.id
            @isRoom = true
            @roomId = cur.id
          end
        end
      end
      #@isRoomがfalse、つまりルームがなければインスタンス作成
      unless @isRoom
        @room = ChatRoom.new
      end
    end
  end

  def edit
    
  end

  def update
    binding.pry
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
    @content = params['content']
    @prefecture_code = params['prefecture_code']
    @category_ids = params['category_ids']
    @shops = search_shop(@content, @prefecture_code, @category_ids)
    render :index
  end

  def followers
    
  end

  def followings
    
  end

  def withdraw
    
  end



  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :name_kana, :post_code, :prefecture_code, :city, :block, :building, :phone_number,:email, :category_id, :catchcopy, :main_image, :sub_image, :appeal_text, :appeal_image, :recommend_name, :recommend_text, :recommend_image, :is_deleted)
  end

  def search_shop(content, prefecture_code, category_ids)
    shops = Shop.all
    #「where!」で例外処理を利用して、present?でtrueの検索をして「return shops」で値を返す
    if content.present?
      shops.where!(['name LIKE ? OR name_kana LIKE ? OR catchcopy LIKE ?', "%#{content}%", "%#{content}%", "%#{content}%"])
    end
    if prefecture_code.present?
      shops.where!(prefecture_code: prefecture_code)
    end
    if category_ids.present?
      shops.where!(category_id: category_ids)
    end
    return shops
  end

end
