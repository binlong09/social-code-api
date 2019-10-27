class CreateStudyGroupComments < ActiveRecord::Migration[5.2]
  def change
    create_table :study_group_comments do |t|
      t.text :content, null: false
      t.string :image_url
      t.references :study_group_post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
