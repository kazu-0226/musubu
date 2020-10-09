require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id name name_kana email post_code prefecture_code city block building 
    phone_number category_id catchcopy appeal_text recommend_name recommend_text is_deleted created_at updated_at)
  csv << csv_column_names
  @shops.each do |shop|
    csv_column_values = [
      shop.id,
      shop.name,
      shop.name_kana,
      shop.email,
      shop.post_code,
      shop.prefecture_code,
      shop.city,
      shop.block,
      shop.building,
      shop.phone_number,
      shop.category_id,
      shop.catchcopy,
      shop.appeal_text,
      shop.recommend_name,
      shop.recommend_text,
      shop.is_deleted,
      shop.created_at,
      shop.updated_at
    ]
    csv << csv_column_values
  end
end