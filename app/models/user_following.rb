class UserFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  #バリデーション
  with_options presence: true,on: :update do
    validates :user_id
    validates :shop_id
  end
end
