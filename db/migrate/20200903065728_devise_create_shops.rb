# frozen_string_literal: true

class DeviseCreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :name
      t.string :name_kana
      t.string :post_code
      t.integer :prefecture_code
      t.string :city
      t.string :block
      t.string :building
      t.string :phone_number
      t.string :category
      t.string :catchcopy
      t.string :main_image_id
      t.string :sub_image_id
      t.text :appeal_text
      t.string :appeal_image_id
      t.string :recommend_name
      t.text :recommend_text
      t.string :recommend_image_id
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end

    add_index :shops, :email,                unique: true
    add_index :shops, :reset_password_token, unique: true
    # add_index :shops, :confirmation_token,   unique: true
    # add_index :shops, :unlock_token,         unique: true
  end
end
