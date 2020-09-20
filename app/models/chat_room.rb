class ChatRoom < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :shop
  has_many :chat_messages

  #バリデーション
  with_options presence: true,on: :update do
    validates :user_id
    validates :shop_id
  end
end
