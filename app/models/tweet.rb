class Tweet < ActiveRecord::Base

  def self.update_tweets
    twitter_handle = Settings::TwitterHandle
    Tweet.destroy_all
    Twitter.user_timeline(twitter_handle, :count => 10).each do |t|
      Tweet.create!(:screen_name => t.screen_name, :text => t.text, :tweet_date => t.created_at)
    end
  end

end
