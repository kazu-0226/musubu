class ShopFollowing < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  
  #バリデーション
  with_options presence: true,on: :update do
    validates :user_id
    validates :shop_id
  end
end
