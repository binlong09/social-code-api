# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  def current_user
    @current_user ||= scope
  end
end