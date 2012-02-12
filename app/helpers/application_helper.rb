module ApplicationHelper

  def logged_in?
    session[:user_id]
  end

  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    end
  end

  # def ga_code
    # if Setting.find_by_name("ga_code").nil?
      # @ga_code = "<!-- No Google Analytics code present -->"
    # else
      # @ga_code = Setting.find_by_name("ga_code").value
    # end
  # end

  def pagetitle
    if Setting.find_by_name("blogtitle").nil?
      @blogtitle = "Blog Title"
    else
      @blogtitle = Setting.find_by_name("blogtitle").value
    end

    if @title.nil?
        @blogtitle
      else
        "#{@blogtitle} | #{@title}"
      end
    end

  def markdown(text)
    redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
             :autolink => true, :space_after_headers => true)
    redcarpet.render(text).html_safe
  end

  # def markdown(text)
    # options = [ :hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]

    # Markdown.new(text, *options).to_html.html_safe
  # end

  def tweets
   Tweet.order("tweet_date desc").limit(5)
  end

  def tweet_handle_parser(tweet)
    tweet.gsub(/@(\w+)/) { |handle| "<a href=http://twitter.com/#{$1} target=_new>@#{$1}</a>" }
  end

end
