class AddPostCountToStudyGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :study_groups, :post_count, :integer, default: 0
  end
end
