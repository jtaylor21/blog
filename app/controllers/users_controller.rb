class UsersController < ApplicationController

  before_filter :require_user

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, :notice => "Please sign in first"
      return
    end

    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Logged in succesfully"
    redirect_to @user
    else
      render 'new'
    end
  end


end
