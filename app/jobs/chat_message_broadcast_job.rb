class ChatMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    ActionCable.server.broadcast "room_channel_#{chat_message.room_id}", chat_message: render_chat_message(chat_message)
  end

  private

  def render_chat_message(chat_message)
    ApplicationController.renderer.render partial: 'chat_messages/chat_message', locals: { chat_message: chat_message }
  end
end
