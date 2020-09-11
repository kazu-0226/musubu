class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #アソシエーション
  belongs_to :category, optional: true
  has_many :user_followings, dependent: :destroy
  has_many :shop_followings, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :chat_messages, dependent: :destroy

  #画像アップロード
  attachment :user_image

  def full_name
    if self.last_name.present? && self.first_name.present?
      self.last_name + self.first_name
    end
  end

  def full_name_kana
    if self.last_name_kana.present? && self.first_name_kana.present?
    self.last_name_kana + self.first_name_kana
  end
  end

  #jp_prefectureを使用したprefecture_codeからprefecture_nameへの変換
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  #希望地域のprefecture_codeからprefecture_nameへの変換
  def hope_prefecture_name
    JpPrefecture::Prefecture.find(code: hope_prefecture_code).try(:name)
  end

  def hope_prefecture_name=(hope_prefecture_name)
    self.hope_prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  #ユーザがフォローしているお店をすでフォローしているかしていないか
  def followed_by?(shop)
    shop_followings.where(shop_id: shop.id).exists?
  end
end
