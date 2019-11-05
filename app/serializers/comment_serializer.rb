# frozen_string_literal: true

class CommentSerializer < ApplicationSerializer
  attributes :id, :content, :image_url, :user_id, :study_group_id, :created_at
end