class RenameHopeCategoryColmunToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :hope_category, :category_id
  end
end
