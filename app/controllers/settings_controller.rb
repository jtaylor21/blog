class SettingsController < ApplicationController

  before_filter :require_user

  def require_user
    if session[:user_id] == nil
      redirect_to root_url, :notice => "No way!"
    end
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def index
    @settings = Setting.all
  end

  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to settings_url, :notice => "#{@setting.name.titleize} was successfully updated." }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
