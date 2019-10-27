# frozen_string_literal: true

class StudyGroupPostPolicy < ApiPolicy
  def index?
    @user.present?
  end

  def show?
    @user.present?
  end

  def create?
    @user.present?
  end

  def destroy?
    owner?
  end

  def update?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
