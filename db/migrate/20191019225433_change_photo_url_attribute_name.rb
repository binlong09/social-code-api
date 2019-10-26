class ChangePhotoUrlAttributeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :study_groups, :photo_url, :image_url
    rename_column :study_groups, :class_name, :study_group_name
    change_column :study_groups, :going_count, :integer, default: 0
  end
end
