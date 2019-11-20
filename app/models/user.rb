class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = %r{\A[a-zA-Z0-9_\.]{3,32}@gettysburg.edu\z}

  devise :recoverable, :confirmable

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_many :study_group_memberships
  has_many :study_group_posts
  has_many :study_group_comments
  has_many :study_group_bookmarks

  def encrypted_password
    password_digest
  end

  def bookmarked_study_groups
    StudyGroup.where(id: study_group_bookmarks.select(:study_group_id))
  end

  def going_study_groups
    StudyGroup.where(id: study_group_memberships.select(:study_group_id))
  end

  def created_study_groups
    StudyGroup.where(id: study_group_memberships.owner.select(:study_group_id))
  end
end
