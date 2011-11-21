class Tweet < ActiveRecord::Base

  def update_tweets_table
   initialize_twitter

    Twitter.user_timeline(@twitter_handle, options = {:count => 5}).each do |t|
      Tweet.create!(:text => t.text)
    end
  end

  def initialize_twitter
    if Setting.find_by_name("twitter_handle").nil?
      @twitter_handle = "twitter"
    else
     @twitter_handle = Setting.find_by_name("twitter_handle").value
    end
  end
  
end