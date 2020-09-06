class Category < ApplicationRecord
    has_many :users
    has_many :products
end
