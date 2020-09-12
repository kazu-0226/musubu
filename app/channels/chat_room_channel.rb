class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #chat_room_channel.rbとchat_room_channel.coffee間のデータをデータを送受信
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #room_channel.jsで実行されたspeakのメッセージを受け取り、メッセージ作成？
  def speak(data)
    if data["user_id"].present?
      ChatMessage.create! content: data["content"], user_id: data["user_id"], chat_room_id: data["chat_room_id"]
    else
      ChatMessage.create! content: data["content"], shop_id: data["shop_id"], chat_room_id: data["chat_room_id"]
    end
  end
end
