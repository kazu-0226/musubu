class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :news_image_id
      t.string :title
      t.text :content
      t.date :start_date
      t.date :end_date
      t.boolean :open_status, default: false, null: false

      t.timestamps
    end
  end
end
