class StudyGroupPost < ApplicationRecord
  belongs_to :study_group, counter_cache: :post_count
  belongs_to :user
  has_many :study_group_comments
  validates :content, presence: true

  default_scope { order("created_at DESC") }
end
