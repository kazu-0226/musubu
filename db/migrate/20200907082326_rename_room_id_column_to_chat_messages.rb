class RenameRoomIdColumnToChatMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :chat_messages, :room_id, :chat_room_id
  end
end
