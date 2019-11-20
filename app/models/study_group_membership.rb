class StudyGroupMembership < ApplicationRecord
  belongs_to :study_group, counter_cache: :going_count
  belongs_to :user
  validates :user, uniqueness: { scope: :study_group }

  enum role: [:member, :owner]
end
