# frozen_string_literal: true

class StudyGroupPost::IndexSerializer < ApplicationSerializer
  attributes :id, :content, :image_url, :user, :study_group_id, :comments_count, :created_at

  def user
    {
      user_id: object.user.id,
      name: object.user.name,
      avatar_url: object.user.avatar_url
    }
  end

  def created_at
    date = object.created_at
    date.strftime("%b %d") + " at " + date.strftime("%I:%M%p")
  end

end
