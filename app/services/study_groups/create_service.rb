module StudyGroups
  class CreateService
    include ActiveModel::Validations
    attr_reader :current_user, :params, :study_group

    def initialize(current_user, params = {})
      @current_user = current_user
      @params = params
    end

    def call
      return false unless valid?
      create_study_group
    end

    def errors
      @study_group ? @study_group.errors : super
    end

    private

    def create_study_group
      @study_group = StudyGroup.new(params)
      if @study_group.save
        create_study_group_membership
        true
      end
    end

    def create_study_group_membership
      study_group_membership = current_user.study_group_memberships.build(
        study_group: study_group,
        role: 0,
      )
      study_group_membership.save
    end
  end
end