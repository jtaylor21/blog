module ApplicationHelper

  def ga_code
    if Setting.find_by_name("ga_code").nil?
      @ga_code = "<!-- No Google Analytics code present -->"
    else
      @ga_code = Setting.find_by_name("ga_code").value
    end
  end

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

    options = [ :hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    Redcarpet.new(text, *options).to_html.html_safe

  end

  def tweets
   Tweet.order("created_at desc").limit(5)
  end

  def tweet_handle_parser(tweet)
    tweet.gsub(/@(\w+)/) { |handle| "<a href=http://twitter.com/#{$1} target=_new>@#{$1}</a>" }
  end

end