module StudyGroups
  class AttendanceUpdateService
    include ActiveModel::Validations
    attr_reader :current_user, :study_group, :going

    def initialize(current_user, going, study_group)
      @current_user = current_user
      @going = going
      @study_group = study_group
    end

    def call
      return false unless valid?
      update_attendance
    end

    def errors
      @study_group ? @study_group.errors : super
    end

    private

    def update_attendance
      if going
        from_not_going_to_going
      else
        from_going_to_not_going
      end
    end

    def from_not_going_to_going
      membership = @study_group.study_group_memberships.build(
        user: @current_user,
        role: 0
      )
      if membership.save
        true
      end
    end

    def from_going_to_not_going
      membership = @study_group.study_group_memberships.find_by(
        user: @current_user
      )
      if membership.destroy
        true
      end
    end

  end
end