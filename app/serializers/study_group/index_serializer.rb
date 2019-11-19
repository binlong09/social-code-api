# frozen_string_literal: true

class StudyGroup::IndexSerializer < ApplicationSerializer
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

  def meeting_time
    object.meeting_time.strftime("%A %I:%M%p")
  end

  def going_count
    if object.going_count == 0
      return 0
    else
      return object.going_count - 1
    end
  end
end
