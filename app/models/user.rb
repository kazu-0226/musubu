class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :omniauthable , omniauth_providers: [:google_oauth2]

  #アソシエーション
  belongs_to :category, optional: true
  has_many :user_followings, dependent: :destroy
  has_many :shop_followings, dependent: :destroy
  has_many :chat_rooms, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  #画像アップロード
  attachment :user_image
    
  #バリデーション
  validates :is_deleted,  inclusion: { in: [true, false]}

  with_options presence: true,on: :update do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :prefecture_code
    validates :phone_number
    validates :hope_prefecture_code
    validates :category_id
    validates :personality
    #validates :user_image
    validates :pr
  end

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

  # フォロー通知(user→shop)
  def create_notification_follow_shop!(shop)
    temp = Notification.where(["visiter_id = ? and visiter_type = ? and visited_id = ? and visited_type = ? and action = ? ", id, 'user', shop.id, 'shop', 'follow'])
    # if temp.blank? 再フォローぼ場合も通知したいため削除
      notification = active_notifications.new(
        visiter_id: id,
        visiter_type: 'user',
        visited_id: shop.id,
        visited_type: 'shop',
        action: 'follow'
      )
      notification.save if notification.valid?
    # end
  end

  #ユーザが退会している場合はログインを弾く
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  protected
  # google認証
    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
    end

end
