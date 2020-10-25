class Notification < ApplicationRecord
  default_scope->{order(created_at: :desc)}
  belongs_to :chat_room, optional: true
  belongs_to :chat_message, optional: true
  belongs_to :user_visiter, class_name: 'User', foreign_key: 'visiter_id'
  belongs_to :user_visited, class_name: 'User', foreign_key: 'visited_id'
  belongs_to :shop_visiter, class_name: 'Shop', foreign_key: 'visiter_id'
  belongs_to :shop_visited, class_name: 'Shop', foreign_key: 'visited_id'
end
