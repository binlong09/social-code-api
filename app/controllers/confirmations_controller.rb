class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    # TODO: need to do this after deploying the app to production
    # redirect_to 'https://logivan-bd7a4.firebaseapp.com/'
    "https://google.com"
  end
end
