# frozen_string_literal: true

class StudyGroupPost::ShowSerializer < ApplicationSerializer
  attributes :id, :content, :image_url, :user_id, :study_group_id, :comments_count, :created_at

  has_many :study_group_comments, serializer: CommentSerializer
end