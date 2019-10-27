class StudyGroupMembership < ApplicationRecord
  belongs_to :study_group, counter_cache: :going_count
  belongs_to :user

  enum role: [:owner, :member]
end
