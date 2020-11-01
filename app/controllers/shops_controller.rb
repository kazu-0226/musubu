class ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:edit, :update, :withdraw]
  before_action :block_wrong_shop, only: [:edit, :update, :withdraw]
  before_action :set_shop, only: [:show, :edit, :update, :withdraw, :followers, :followings ]
  before_action :check_guest, only: [:update, :withdraw ]

  def show
    if @shop.is_deleted == false
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
    else
      flash[:notice] = "この店舗は退会しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      flash[:error] = "保存に失敗しました。"
      render :edit
    end
  end

  def index
    @shops= Shop.where(is_deleted: false).where.not(name: nil).page(params[:page]).per(5)
  end

  def search
    @content = params['content']
    @prefecture_code = params['prefecture_code']
    @category_ids = params['category_ids']
    @shops = search_shop(@content, @prefecture_code, @category_ids).where(is_deleted: false).where.not(name: nil).page(params[:page]).per(5)
  end

  def followers
    
  end

  def followings
    
  end

  def withdraw
    @shop.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end



  private
    def set_shop
      @shop = Shop.find(params[:id])
    end

    def block_wrong_shop
      if params[:id].to_i != current_shop.id
        flash[:alert] = "権限がありません"
        redirect_to root_path
      end
    end

    def check_guest
      @guest = Shop.find_by(email: 'guest@example.com')
      if current_shop == @guest
        flash[:alert] = "ゲストアカウントのため、変更や退会はお控えください"
        redirect_to root_path
      end
    end

    def shop_params
      params.require(:shop).permit(:name, :name_kana, :post_code, :prefecture_code, :city, :block, :building, :phone_number,:email, :category_id, :catchcopy, :main_image, :sub_image, :appeal_text, :appeal_image, :recommend_name, :recommend_text, :recommend_image, :is_deleted)
    end

    def search_shop(content, prefecture_code, category_ids)
      shops = Shop.where(is_deleted: false)
      #「where!」で破壊的メソッドを利用して、present?でtrueの検索をして「return shops」で値を返す
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
