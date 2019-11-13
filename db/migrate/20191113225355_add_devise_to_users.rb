class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    # Confirmable
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    # t.string   :unconfirmed_email # Only if using reconfirmable

    User.update_all confirmed_at: DateTime.now

    ## Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

  add_index :users, :reset_password_token, unique: true
  # add_index :users, :confirmation_token,   unique: true
  # add_index :users, :unlock_token,         unique: true
  end
end
