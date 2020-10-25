class Category < ApplicationRecord
  has_many :users
  has_many :products

  #バリデーション
  with_options presence: true do
    validates :code
    validates :name
  end
end
