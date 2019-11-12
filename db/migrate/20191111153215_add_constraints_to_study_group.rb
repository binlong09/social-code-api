class AddConstraintsToStudyGroup < ActiveRecord::Migration[5.2]
  def change
    change_column :study_groups, :meeting_time, :datetime, null: false
    change_column :study_groups, :study_group_name, :string, null: false
    change_column :study_groups, :class_code, :string, null: false
    change_column :study_groups, :semester, :integer, default: 0
  end
end
