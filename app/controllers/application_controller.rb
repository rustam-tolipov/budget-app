class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user, :logged_in?

  def logged_in?
    !current_user.nil?
  end

  def require_user
    return if logged_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name income avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name income avatar])
  end
end
