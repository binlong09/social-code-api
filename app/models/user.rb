class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEX = %r{\A[a-z][a-z0-9_\.]{3,32}@gettysburg.edu\z}

  validates :email, presence: true, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, format: { with: EMAIL_REGEX }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }


end
