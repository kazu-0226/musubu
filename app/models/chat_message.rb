class ChatMessage < ApplicationRecord
  #アソシエーション
  belongs_to :room
  belongs_to :user
  belongs_to :shop
end
