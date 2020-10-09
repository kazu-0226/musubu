require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id first_name last_name first_name_kana last_name_kana email prefecture_code phone_number hope_prefecture_code category_id Pr 
    is_deleted created_at updated_at)
  csv << csv_column_names
  @users.each do |user|
    csv_column_values = [
      user.id,
      user.first_name,
      user.last_name,
      user.first_name_kana,
      user.last_name_kana,
      user.email,
      user.prefecture_code,
      user.phone_number,
      user.hope_prefecture_code,
      user.category_id,
      user.pr,
      user.is_deleted,
      user.created_at,
      user.updated_at
    ]
    csv << csv_column_values
  end
end