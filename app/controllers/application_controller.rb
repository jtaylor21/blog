class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def logged_in?
    session[:user_id].present?
  end

  def require_login
    unless logged_in?
      redirect_to home_url
    end
  end

end
