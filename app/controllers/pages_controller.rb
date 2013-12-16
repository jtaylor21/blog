class PagesController < ApplicationController

  def home
    @posts = Post.all.sort.take(3)
  end

end
