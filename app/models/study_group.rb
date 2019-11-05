class StudyGroup < ApplicationRecord
  has_many :study_group_memberships
  has_many :study_group_posts

  enum semester: {
    fall_2019: 0,
    spring_2020: 1
  }

  def owners
    StudyGroupMembership.where(role: 0, study_group_id: self.id)
  end
end