class ChatRoomsController < ApplicationController

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
    @shop_messages = @room.chat_messages.where(shop_id: @room.shop_id)
    @user_messages = @room.chat_messages.where(user_id: @room.user_id)
    @message = ChatMessage.new
  end

end
