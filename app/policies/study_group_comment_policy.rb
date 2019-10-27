# frozen_string_literal: true

class StudyGroupCommentPolicy < ApiPolicy
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
