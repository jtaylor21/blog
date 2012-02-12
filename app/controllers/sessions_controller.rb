class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Welcome back!"
      else
        flash[:notice] = "Please try again."
        render :new
      end
    end


  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out"
  end

end
