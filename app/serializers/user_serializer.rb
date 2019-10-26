# Frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  attributes :id, :name, :email, :phone_number, :graduation_date, :major, :created_at, :updated_at

end
