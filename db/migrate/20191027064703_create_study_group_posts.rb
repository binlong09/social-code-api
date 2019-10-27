class CreateStudyGroupPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :study_group_posts do |t|
      t.references :study_group, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content, null: false
      t.string :image_url
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
