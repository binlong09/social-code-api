require "administrate/base_dashboard"

class StudyGroupMembershipDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    study_group: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    role: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :study_group,
    :user,
    :id,
    :role,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :study_group,
    :user,
    :id,
    :role,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :study_group,
    :user,
    :role,
  ].freeze

  # Overwrite this method to customize how study group memberships are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(study_group_membership)
  #   "StudyGroupMembership ##{study_group_membership.id}"
  # end
end
