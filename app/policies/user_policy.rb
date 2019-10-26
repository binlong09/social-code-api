# frozen_string_literal: true

class UserPolicy < ApiPolicy
  def index?
    false
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    false
  end

  def update?
    self?
  end
end
