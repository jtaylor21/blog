class Tweet < ActiveRecord::Base

  def self.update_tweets
  #def initialize_twitter
    if !Setting.find_by_name("twitter_handle").present?
       Setting.create!(:name => "twitter_handle", :value => "twitter")
    end
     @twitter_handle = Setting.find_by_name("twitter_handle").value
  #end

    Twitter.user_timeline(@twitter_handle, options = {:count => 100}).each do |t|

      created_at = DateTime.parse(t.created_at)

      unless Tweet.exists?(['created_at = ?', DateTime.parse(t.created_at)])

        Tweet.create!({
            :user => t.string,
            :text => t.text,
            :created_at => t.created_at
        })
      end
    end
  end


end
