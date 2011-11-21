desc "This task is called by the Heroku cron add-on"

task :cron => :production do

  if Time.now.hour == 0 # run at midnight
    Tweet.update_tweets_table
    
  end
end