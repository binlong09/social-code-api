class CreateStudyGroupBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :study_group_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :study_group, foreign_key: true

      t.timestamps
    end

    add_column :study_groups, :bookmark_count, :integer, default: 0
  end
end
