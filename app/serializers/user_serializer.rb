# Frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id,
                   :name,
                   :email,
                   :phone_number,
                   :graduation_date,
                   :major,
                   :avatar_url,
                   :bookmarked_study_groups,
                   :going_study_groups,
                   :created_study_groups,
                   :created_at,
                   :updated_at

  def bookmarked_study_groups
    object.bookmarked_study_groups.map do |bookmark|
      StudyGroupSerializer.new(bookmark, scope: scope, root: false)
    end
  end

  def created_study_groups
    object.created_study_groups.map do |created|
      StudyGroupSerializer.new(created, scope: scope, root: false)
    end
  end

  def going_study_groups
    object.going_study_groups.map do |going|
      StudyGroupSerializer.new(going, scope: scope, root: false)
    end
  end
end
