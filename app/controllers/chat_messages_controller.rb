class ChatMessagesController < ApplicationController

    def create
        @message = ChatMessage.new(message_params)
        if user_signed_in?
            @message.user_id = current_user.id
        elsif shop_signed_in?
            @message.shop_id = current_shop.id
        end
        if @message.save
            redirect_to chat_room_path(@message.chat_room_id) 
        else
            redirect_to chat_room_path(@message.chat_room_id) , alert: "送信に失敗しました"
        end
    end

    private
    def message_params
      params.require(:chat_message).permit(:content, :chat_room_id)
    end
end
