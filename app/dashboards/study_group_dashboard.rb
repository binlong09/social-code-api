require "administrate/base_dashboard"

class StudyGroupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    study_group_memberships: Field::HasMany,
    id: Field::Number,
    class_code: Field::String,
    class_name: Field::String,
    location: Field::String,
    semester: Field::String.with_options(searchable: false),
    meeting_time: Field::DateTime,
    professor_name: Field::String,
    going_count: Field::Number,
    photo_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    # :study_group_memberships,
    :id,
    :class_code,
    :class_name,
    :professor_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :study_group_memberships,
    :id,
    :class_code,
    :class_name,
    :location,
    :semester,
    :meeting_time,
    :professor_name,
    :going_count,
    :photo_url,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :study_group_memberships,
    :class_code,
    :class_name,
    :location,
    :semester,
    :meeting_time,
    :professor_name,
    :going_count,
    :photo_url,
  ].freeze

  # Overwrite this method to customize how study groups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(study_group)
  #   "StudyGroup ##{study_group.id}"
  # end
end
