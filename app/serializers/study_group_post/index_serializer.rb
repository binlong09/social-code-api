# frozen_string_literal: true

class StudyGroupPost::IndexSerializer < ApplicationSerializer
  attributes :id, :content, :image_url, :user_id, :study_group_id, :comments_count, :created_at
end