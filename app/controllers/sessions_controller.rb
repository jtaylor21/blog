class SessionsController < ApplicationController

  def new
  end

  def create

      user = User.authenticate(params[:session][:email],
                               params[:session][:password])
      if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        render 'new'
      else
        sign_in user
        redirect_to posts_url, :notice => "Logged in as #{user.name}"
      end

      # omniauth-twitter
      # data = request.env["omniauth.auth"]
      # twitter_user_id = data['uid']
      # name = data['info']['name']
      # logger.debug "Twitter User ID looks to be #{twitter_user_id}"
      # logger.debug "Twitter Name looks to be #{name}"

      # user = User.find_by_uid(twitter_user_id)

      # if user
        # session[:user_id] = user.id
        # redirect_to root_url, :notice => "Logged in with Twitter"
      # else
        # User.create()
        # redirect_to root_url, :notice => "Hi welcome and thanks for signing up"
      # end

      # session[:uid] = twitter_user_id
      # redirect_to root_url, :notice => "#{name} signed in!"
    end


  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out"
  end

end
