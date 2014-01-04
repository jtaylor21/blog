class PagesController < ApplicationController

  def home
    @posts = Post.all.order('created_at DESC')[0..2]
    @greeting = "I'm Vincent Cabansag, an entreprenuer and developer. I help make the <a href='http://www.starterleague.com'>Starter League</a> the best place to learn and work. I teach at the <a href='http://www.starterschool.com'>Starter School</a>. And I also like to take <a href='http://instagram.com/vcabansag'>photos</a>."
  end

end
