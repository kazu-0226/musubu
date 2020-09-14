class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  #private以下の記述で左右のパーシャル両方をmessage_right、 message_leftに渡す。また左右の表示を分けるためにsend_idを渡す。
  def perform(chat_message)
    if chat_message.user_id.present? 
      ActionCable.server.broadcast 'chat_room_channel', message_right: render_message_right(chat_message), message_left: render_message_left(chat_message),send_id: @arguments[0].user_id
    else
      ActionCable.server.broadcast 'chat_room_channel', message_right: render_message_right(chat_message), message_left: render_message_left(chat_message),send_id: @arguments[0].shop_id
    end
  end

  private
  #左右のパーシャルを分けて作成。chat_messageにuser_idがあればユーザの送信メッセージ、なければお店のメッセージとなる。
  def render_message_right(chat_message)
    if chat_message.user_id.present? 
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_right', locals: { target_path: Rails.application.routes.url_helpers.user_path(chat_message.user), image_name: :user_image , image: chat_message.user, content:chat_message.content, created_at: chat_message.created_at }
    else
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_right', locals: { target_path: Rails.application.routes.url_helpers.shop_path(chat_message.shop), image_name: :main_image , image: chat_message.shop, content:chat_message.content, created_at: chat_message.created_at }
    end
  end

  def render_message_left(chat_message)
    if chat_message.user_id.present? 
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.user_path(chat_message.user), image_name: :user_image , image: chat_message.user, content:chat_message.content, created_at: chat_message.created_at }
    else
      ApplicationController.renderer.render partial: 'chat_messages/chat_message_left', locals: { target_path: Rails.application.routes.url_helpers.shop_path(chat_message.shop), image_name: :main_image , image: chat_message.shop, content:chat_message.content, created_at: chat_message.created_at }
    end
  end
end

