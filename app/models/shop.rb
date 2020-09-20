class Shop < ApplicationRecord
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
  attachment :main_image
  attachment :sub_image
  attachment :appeal_image
  attachment :recommend_image
  
  #バリデーション
  validates :is_deleted,  inclusion: { in: [true, false]}

  with_options presence: true,on: :update do
    validates :name
    validates :name_kana
    validates :post_code
    validates :prefecture_code
    validates :city
    validates :block
    validates :building
    validates :phone_number
    validates :category_id
    validates :catchcopy
    #validates :main_image
    #validates :sub_image
    validates :appeal_text
    #validates :appeal_image
    validates :recommend_name
    validates :recommend_text
    #validates :recommend_image
  end

  validates :appeal_text, length: {maximum: 250}
  validates :recommend_name, length: {maximum: 15}
  validates :recommend_text, length: {maximum: 220}


  #jp_prefectureを使用したprefecture_codeからprefecture_nameへの変換
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  def address
    "%s %s %s"%([self.prefecture_name, self.city, self.block])
  end

  #adressを緯度経度に変換
  geocoded_by :address
  after_validation :geocode

  #お店がフォローしているユーザをすでフォローしているかしていないか
  def followed_by?(user)
    user_followings.where(user_id: user.id).exists?
  end

  #お店が退会している場合はログインを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  #updateされたら新着に表示
  def updated?
    self.updated_at.between?(1.week.ago, Time.current)
  end
end
