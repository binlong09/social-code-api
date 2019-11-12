class StudyGroupPost < ApplicationRecord
  belongs_to :study_group
  belongs_to :user
  has_many :study_group_comments

  default_scope { order("created_at DESC") }
end
