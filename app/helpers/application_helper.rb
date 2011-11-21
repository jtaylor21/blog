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

   initialize_twitter

   #Tweet.order("created_at desc").limit(5)

   Twitter.user_timeline(@twitter_handle, options = {:count => 5})

    #Twitter.user_timeline(@twitter_handle, options = {:count => 5}).each do |t|
    # @tweets = Tweet.create!(:text => t.text)
    #end

  end

  def initialize_twitter

    if Setting.find_by_name("twitter_handle").nil?
      @twitter_handle = "twitter"
    else
     @twitter_handle = Setting.find_by_name("twitter_handle").value
    end

  end

  def tweet_handle_parser(tweet)
    tweet.gsub(/@(\w+)/) { |handle| "<a href=http://twitter.com/#{$1} target=_new>@#{$1}</a>" }
  end




end
