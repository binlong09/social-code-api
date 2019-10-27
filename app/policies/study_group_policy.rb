# frozen_string_literal: true

class StudyGroupPolicy < ApiPolicy
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

  def going?
    @user.present?
  end

  def not_going?
    @user.present?
  end

  private

  def owner?
    record.owners.pluck(:user_id).include? user.id
  end
end
