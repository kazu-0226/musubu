class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
