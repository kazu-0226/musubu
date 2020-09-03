class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #attachment :main_image, :sub_image, :appeal_image, :recommend_image

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
    "%s %s %s %s %s"%([self.post_code, self.prefecture_name, self.city, self.block, self.building])
  end

  #adressを緯度経度に変換
  geocoded_by :address
  after_validation :geocode

end
