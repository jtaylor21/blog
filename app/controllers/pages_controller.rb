class PagesController < ApplicationController

  def home
    @posts = Post.all.order('created_at DESC')[0..3]
    @greeting = "I'm Vincent Cabansag, an entreprenuer and developer. I help make the <a href='http://www.starterleague.com' title='Starter League'>Starter League</a> the best place to learn and work. I teach at <a href='http://www.starterschool.com' title='Starter School'>Starter School</a>. And I also like to take <a href='http://instagram.com/vcabansag' title='vcabansag on Instagram'>photos</a>."
  end

  def resume
  end

end
