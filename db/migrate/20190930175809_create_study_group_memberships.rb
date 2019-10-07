class CreateStudyGroupMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :study_group_memberships do |t|
      t.references :study_group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
