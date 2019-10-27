# frozen_string_literal: true

class StudyGroupPolicy < ApiPolicy
  def index?
    @user.present?
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
