# frozen_string_literal: true

class CommentSerializer < ApplicationSerializer
  attributes :id, :content, :image_url, :user, :created_at

  def created_at
    date = object.created_at
    date.strftime("%b %d") + " at " + date.strftime("%I:%M%p")
  end

  def user
    {
      user_id: object.user.id,
      name: object.user.name,
      avatar_url: object.user.avatar_url
    }
  end
end