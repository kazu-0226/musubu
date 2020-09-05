class RenameHopePerfectureCodeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :hope_perfecture_code, :hope_prefecture_code
  end
end
