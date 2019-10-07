class CreateStudyGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :study_groups do |t|
      t.string :class_code
      t.string :class_name
      t.string :location
      t.integer :semester
      t.datetime :meeting_time
      t.string :professor_name
      t.integer :going_count
      t.string :photo_url

      t.timestamps
    end
  end
end
