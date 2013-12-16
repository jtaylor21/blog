class PagesController < ApplicationController

  def home
    @posts = Post.all.sort.reverse[0..2]
  end

end
