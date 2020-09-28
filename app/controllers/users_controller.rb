class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :withdraw]
  before_action :block_wrong_user, only: [:edit, :update, :withdraw]
  before_action :set_user, only: [:show, :edit, :update, :withdraw, :followers, :followings ]

  def show
    if @user.is_deleted == false
      #店がユーザ詳細にてチャットを開始するため、店舗がログインしていることが条件
      if shop_signed_in?
        #お店と会員のチャットルームをeachで一つずつ取り出す
        current_shop.chat_rooms.each do |csr|
          @user.chat_rooms.each do |ur|
            #お店と会員のルームIDが等しければすでにルームは作成済みのため、@isRoom = trueとして@roomId = csr.idを代入
            if csr.id == ur.id
              @isRoom = true
              @roomId = csr.id
            end
          end
        end
        #@isRoomがfalse、つまりルームがなければインスタンス作成
        unless @isRoom
          @room = ChatRoom.new
        end
      end
    else
      flash[:notice] = "このユーザーは退会しました"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = "保存に失敗しました。"
      render :edit
    end
  end

  def index
    @users = User.where(is_deleted: false).where.not(first_name: nil,last_name: nil ).page(params[:page]).per(5)
  end

 
  def search
    @content = params['content']
    @prefecture_code = params['prefecture_code']
    @category_ids = params['category_ids']
    @users = search_user(@content, @prefecture_code, @category_ids).where(is_deleted: false).where.not(first_name: nil,last_name: nil ).page(params[:page]).per(5)
  end

  def followers
    
  end

  def followings
    
  end

  def withdraw
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def block_wrong_user
    if params[:id].to_i != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :prefecture_code, :phone_number, :email, :hope_prefecture_code, :category_id, :personality, :user_image, :pr )
  end

  def search_user(content, prefecture_code, category_ids)
    users = User.where(is_deleted: false)
    #「where!」で例外処理を利用して、present?でtrueの検索をして「return shops」で値を返す
    if content.present?
      users.where!(['first_name LIKE ? OR last_name LIKE ? OR first_name_kana LIKE ? OR last_name_kana LIKE ? OR pr LIKE ?', "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"])
    end
    if prefecture_code.present?
      users.where!(hope_prefecture_code: prefecture_code)
    end
    if category_ids.present?
      users.where!(category_id: category_ids)
    end
    return users
  end

end
