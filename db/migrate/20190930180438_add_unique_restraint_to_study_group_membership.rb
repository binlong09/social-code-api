class AddUniqueRestraintToStudyGroupMembership < ActiveRecord::Migration[5.2]
  def change
    add_index :study_group_memberships, [:study_group_id, :user_id], unique: true
    add_index :users, :email, unique: true
  end
end
