class ApplicationSerializer < ActiveModel::Serializer
  def current_user
    @current_user ||= view_context.current_user
  end
end