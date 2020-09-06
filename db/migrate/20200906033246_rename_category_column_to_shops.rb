class RenameCategoryColumnToShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :category, :category_id
  end
end
