class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable.server.broadcast "chat_room_channel_#{chat_message.chat_room_id}", chat_message: render_chat_message(chat_message)
    # ActionCable.server.broadcast "chat_room_channel_#{chat_message.chat_room_id}", chat_message: render_chat_message(chat_message.chat_room.chat_messages.where(user_id: chat_message.chat_room.user.id), chat_message.chat_room.chat_messages.where(shop_id: chat_message.chat_room.shop.id))
  end

  private

  def render_chat_message(chat_message )
    #if user_messages.present?
    ApplicationController.render_with_signed_in_user(chat_message.user, partial: 'chat_messages/chat_message', locals: { user_messages: chat_message})
    #else shop_messages.present?
    ApplicationController.render_with_signed_in_shop(chat_message.shop,partial: 'chat_messages/chat_message', locals: { shop_message: chat_message })
  #end
  end

end
