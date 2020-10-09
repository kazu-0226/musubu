require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(id created_at updated_at)
  csv << csv_column_names
  @chat_rooms.each do |chat_room|
    csv_column_values = [
      chat_room.id,
      chat_room.user_id,
      chat_room.shop_id,
      chat_room.created_at,
      chat_room.updated_at
    ]
    csv << csv_column_values
  end
end