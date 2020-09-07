class ChatMessage < ApplicationRecord
  #アソシエーション
  belongs_to :chat_room
  belongs_to :user, optional: true
  belongs_to :shop, optional: true
end
