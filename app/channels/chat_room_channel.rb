class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #chat_room_channel.rbとchat_room_channel.coffee間のデータをデータを送受信
    stream_from "chat_room_channel_#{params['chat_room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #room_channel.jsで実行されたspeakのメッセージを受け取り、メッセージ作成？
  def speak(data)
    chat_room_id =  params['chat_room']
    if 
    user_id = current_user.id
    binding.pry
    ChatMessage.create! content: "aaaa", user_id: user_id, chat_room_id: chat_room_id
    elsif shop_signed_in?
    shop_id = current_shop.id
    binding.pry
    ChatMessage.create! content: "aaaa", shop_id: shop_id, chat_room_id: chat_room_id
    end

    
  end
end
