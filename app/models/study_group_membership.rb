class StudyGroupMembership < ApplicationRecord
  belongs_to :study_group
  belongs_to :user

  enum role: {
    owner: 0,
    member: 1
  }
end
