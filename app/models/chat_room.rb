class ChatRoom < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :shop
  has_many :chat_messages
end
