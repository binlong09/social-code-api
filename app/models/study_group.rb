class StudyGroup < ApplicationRecord
  default_scope { order("created_at DESC") }

  has_many :study_group_memberships
  has_many :study_group_posts

  validates :meeting_time, :study_group_name, :class_code, presence: true

  enum semester: {
    fall_2019: 0,
    spring_2020: 1
  }

  def owners
    StudyGroupMembership.where(role: 0, study_group_id: self.id)
  end
end
