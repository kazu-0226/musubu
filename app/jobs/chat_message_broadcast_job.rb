class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
      ActionCable.server.broadcast 'chat_room_channel', message: render_chat_message(chat_message)
  end

  private

  def render_chat_message(chat_message)
    if chat_message.user_id.present?
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.user_path(chat_message.user), image_name: :user_image , image: chat_message.user, content:chat_message.content, created_at: chat_message.created_at }
    else
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.shop_path(chat_message.shop), image_name: :main_image , image: chat_message.shop, content:chat_message.content, created_at: chat_message.created_at }
    end
  end
end
