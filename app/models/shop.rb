class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #画像アップロード
  #attachment :main_image, :sub_image, :appeal_image, :recommend_image
  attachment :main_image
  attachment :sub_image
  attachment :appeal_image
  attachment :recommend_image

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
end
