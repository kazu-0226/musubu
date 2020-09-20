class Category < ApplicationRecord
    has_many :users
    has_many :products

  #バリデーション
  with_options presence: true,on: :update do
    validates :code
    validates :name
  end
end
