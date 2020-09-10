class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable.server.broadcast "chat_room_channel_#{chat_message.chat_room_id}", chat_message: render_chat_message(chat_message.chat_room.chat_messages.where(user_id: chat_message.chat_room.user.id), chat_message.chat_room.chat_messages.where(shop_id: chat_message.chat_room.shop.id))
  end

  private

  def render_chat_message(user_messages, shop_messages )
    ApplicationController.renderer.render partial: 'chat_messages/chat_message', locals: { user_messages: user_messages, shop_messages: shop_messages }
  end
end
