class StudyGroup < ApplicationRecord
  default_scope { order("created_at DESC") }

  has_many :study_group_memberships, dependent: :destroy
  has_many :study_group_posts, dependent: :destroy
  has_many :study_group_bookmarks, dependent: :destroy

  validates :meeting_time, :study_group_name, :class_code, presence: true

  enum semester: {
    fall_2019: 0,
    spring_2020: 1
  }

  def owners
    StudyGroupMembership.where(role: 0, study_group_id: self.id)
  end

  def self.search(search)
    if search
      where('study_group_name ILIKE :search OR class_code ILIKE :search OR professor_name ILIKE :search', search: "%#{search}%")
    else
      find(:all)
    end
  end
end
