# frozen_string_literal: true

class StudyGroup::ShowSerializer < ApplicationSerializer
  attributes :id,
             :class_code,
             :study_group_name,
             :location,
             :semester,
             :meeting_time,
             :origin_meeting_time,
             :professor_name,
             :going_count,
             :post_count,
             :bookmark_count,
             :image_url,
             :going,
             :bookmarked,
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
    if object.study_group_memberships.find_by(user_id: current_user.id, role: :owner).present?
      true
    else
      false
    end
  end

  def bookmarked
    if object.study_group_bookmarks.find_by(user_id: current_user.id).present?
      true
    else
      false
    end
  end

  def meeting_time
    object.meeting_time.strftime("%A %m/%d/%Y %I:%M%p")
  end

  def origin_meeting_time
    object.meeting_time.strftime("%B %dth %Y, %I:%M%p")
  end
end
