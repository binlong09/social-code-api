module StudyGroups
  class BookmarkUpdateService
    include ActiveModel::Validations
    attr_reader :current_user, :study_group, :bookmark

    def initialize(current_user, bookmark, study_group)
      @current_user = current_user
      @bookmark = bookmark
      @study_group = study_group
    end

    def call
      return false unless valid?
      update_bookmark
    end

    def errors
      @study_group ? @study_group.errors : super
    end

    private

    def update_bookmark
      if bookmark
        from_not_bookmarked_to_bookmarked
      else
        from_bookmarked_to_not_bookmarked
      end
    end

    def from_not_bookmarked_to_bookmarked
      bookmark = @study_group.study_group_bookmarks.build(user: @current_user)
      if bookmark.save
        true
      end
    end

    def from_bookmarked_to_not_bookmarked
      bookmark = @study_group.study_group_bookmarks.find_by(user: @current_user)
      if bookmark.destroy
        true
      end
    end

  end
end