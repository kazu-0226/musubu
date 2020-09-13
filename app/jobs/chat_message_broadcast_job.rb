class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    

      ActionCable.server.broadcast 'chat_room_channel', message: render_chat_message(chat_message)
  end

  

  def self.render_chat_message(data)
    chat_message = ChatRoom.find(data["chat_room_id"]).chat_messages.last
    if data["user_id"].present? # user data
      if chat_message.user_id == data["current_id"].to_i
        ApplicationController.renderer.render partial: 'chat_messages/chat_message_right', locals: { target_path: Rails.application.routes.url_helpers.user_path(chat_message.user), image_name: :user_image , image: chat_message.user, content:chat_message.content, created_at: chat_message.created_at }
      else
        ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.user_path(chat_message.user), image_name: :user_image , image: chat_message.user, content:chat_message.content, created_at: chat_message.created_at }
      end
    else
      if chat_message.shop_id == data["current_id"].to_i
        ApplicationController.renderer.render partial: 'chat_messages/chat_message_right', locals: { target_path: Rails.application.routes.url_helpers.shop_path(chat_message.shop), image_name: :main_image , image: chat_message.shop, content:chat_message.content, created_at: chat_message.created_at }
      else
        ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.shop_path(chat_message.shop), image_name: :main_image , image: chat_message.shop, content:chat_message.content, created_at: chat_message.created_at }
      end
    end
  end
end

