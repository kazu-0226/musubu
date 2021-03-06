class ChatRoom < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :shop
  has_many :chat_messages
  has_many :notifications, dependent: :destroy
  #バリデーション
  with_options presence: true do
    validates :user_id
    validates :shop_id
  end
end
