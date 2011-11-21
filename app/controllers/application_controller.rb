class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  require 'twitter'

  def require_user
     if !signed_in?
      redirect_to root_url
    else
      current_user
    end
  end

end
