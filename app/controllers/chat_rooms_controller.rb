class ChatRoomsController < ApplicationController
  before_action :block_wrong_chat, only: [:show]
  def create
    #お店が作成した場合は、cuurent_shop.idとhiddenオプションで送られてきたuser_idを保存
    if shop_signed_in?
      @room = current_shop.chat_rooms.new(user_id: params[:user_id])
      @room.save
    #会員が作成した場合は、cuurent_user.idとhiddenオプションで送られてきたshop_idを保存
    elsif user_signed_in?
      @room = current_user.chat_rooms.new(shop_id: params[:shop_id])
      @room.save
    end
    redirect_to "/chat_rooms/#{@room.id}"
  end

  def show
    @room = ChatRoom.find(params[:id])
    @messages = @room.chat_messages.includes(:user).includes(:shop)
    @message = ChatMessage.new
  end

  def index
    if shop_signed_in?
      @shop = current_shop
      @current_room = current_shop.chat_rooms
      myRoomIds = []
      @current_room.each do |chat_room|
        myRoomIds << chat_room.id
      end
      @shop_chat_rooms = ChatRoom.where(id: myRoomIds).order(created_at: :desc)
    elsif user_signed_in?
      @user = current_user
      @current_room = current_user.chat_rooms
      myRoomIds = []
      @current_room.each do |chat_room|
        myRoomIds << chat_room.id
      end
      @user_chat_rooms = ChatRoom.where(id: myRoomIds).order(created_at: :desc)
    end
  end

  private
  def block_wrong_chat
    chat_room = ChatRoom.find_by(id: params[:id])
    if user_signed_in?
      if chat_room.user_id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to root_path
      end
    elsif shop_signed_in?
      if chat_room.shop_id != current_shop.id
        flash[:alert] = "権限がありません"
        redirect_to root_path
      end
    elsif admin_signed_in?
      flash[:alert] = "管理者でログインしています"
    end
  end


end
