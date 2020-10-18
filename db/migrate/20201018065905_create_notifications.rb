class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.string :visiter_type
      t.integer :visited_id
      t.string :visited_type
      t.integer :chat_room_id
      t.integer :chat_message_id
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
