class StudyGroup < ApplicationRecord
  has_many :study_group_memberships

  enum semester: {
    fall_2019: 0,
    spring_2020: 1
  }
end
