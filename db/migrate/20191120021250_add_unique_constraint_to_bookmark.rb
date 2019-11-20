class AddUniqueConstraintToBookmark < ActiveRecord::Migration[5.2]
  def change
    add_index :study_group_bookmarks, [:study_group_id, :user_id], unique: true
  end
end
