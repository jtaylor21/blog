class PagesController < ApplicationController

  def home
    @posts = Post.all.order('created_at DESC')[0..4]
  end

  def resume
  end

end
