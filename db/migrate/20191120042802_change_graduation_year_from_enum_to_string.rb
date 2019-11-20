class ChangeGraduationYearFromEnumToString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :graduation_date, :string
  end
end
