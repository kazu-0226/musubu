class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :withdraw]
  before_action :set_user, only: [:show, :edit, :update, :withdraw]

  def show
    #店がユーザ詳細にてチャットを開始するため、ユーザがログインしていないことが条件
    unless user_signed_in?
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
  end

  def edit
    
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
    @content = params['content']
    @prefecture_code = params['prefecture_code']
    @category_ids = params['category_ids']
    @users = search_user(@content, @prefecture_code, @category_ids)
    render :index
  end

  def withdraw
    
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :prefecture_code, :phone_number, :email, :hope_perfecture_code, :category_id, :personality, :user_image, :pr )
  end

  def search_user(content, prefecture_code, category_ids)
    users = User.all
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
