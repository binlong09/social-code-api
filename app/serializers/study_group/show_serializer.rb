# frozen_string_literal: true

class StudyGroup::ShowSerializer < ApplicationSerializer
  attributes :id,
             :class_code,
             :study_group_name,
             :location,
             :semester,
             :meeting_time,
             :professor_name,
             :going_count,
             :image_url,
             :going,
             :owned,
             :created_at

  has_many :study_group_posts, serializer: StudyGroupPost::IndexSerializer

  def going
    if object.study_group_memberships.find_by(user_id: current_user.id).present?
      true
    else
      false
    end
  end

  def owned
    if object.study_group_memberships.find_by(user_id: current_user, role: :owner).present?
      true
    else
      false
    end
  end
end
