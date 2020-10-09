require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(first_name last_name first_name_kana last_name_kana email prefecture_code phone_number is_deleted hope_prefecture_code category_id Pr)
  csv << csv_column_names
  @users.each do |user|
    csv_column_values = [
      user.first_name,
      user.last_name,
      user.first_name_kana,
      user.last_name_kana,
      user.email,
      user.prefecture_code,
      user.phone_number,
      user.is_deleted,
      user.hope_prefecture_code,
      user.category_id,
      user.pr

    ]
    csv << csv_column_values
  end
end