class StudyGroupBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :study_group, counter_cache: :bookmark_count
end
