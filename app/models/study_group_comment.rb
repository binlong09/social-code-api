class StudyGroupComment < ApplicationRecord
  belongs_to :study_group_post, counter_cache: :comments_count
  belongs_to :user
  validates :content, presence: true
end
