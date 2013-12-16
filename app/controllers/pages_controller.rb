class PagesController < ApplicationController

  def home
    @posts = Post.all.sort[0..2]
  end

end
