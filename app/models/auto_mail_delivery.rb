class AutoMailDelivery < ApplicationRecord
  #バリデーション
  validates :is_sent, inclusion: { in: [true, false]}
  validates :mail_type, inclusion: { in: [true, false]}
  
  with_options presence: true do
    validates :subject
    validates :target_type
    validates :content
    validates :reservation_time
  end
end
