class CreateAutoMailDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :auto_mail_deliveries do |t|
      t.string :subject
      t.boolean :mail_type, default: false, null: false
      t.text :content
      t.string :target_type
      t.datetime :reservation_time
      
      t.timestamps
    end
  end
end
