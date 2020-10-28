class AddIsSentToAutoMailDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :auto_mail_deliveries, :is_sent, :boolean, default: false, null: false
  end
end
