class News < ApplicationRecord

  # バリデーション  
  validates :open_status, inclusion: { in: [true, false]}
  
  with_options presence: true do
    validates :title
    validates :content
    validates :start_date
    validates :end_date
  end

  # 画像アップロード
  attachment :news_image
end
