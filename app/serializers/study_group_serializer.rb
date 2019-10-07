# frozen_string_literal: true

class StudyGroupSerializer < ApplicationSerializer
  attributes  :id,
                    :class_code,
                    :class_name,
                    :location,
                    :semester,
                    :meeting_time,
                    :professor_name,
                    :going_count,
                    :photo_url
end