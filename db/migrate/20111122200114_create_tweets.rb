class CreateTweets < ActiveRecord::Migration

  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.string :text
      t.datetime :tweet_date

      t.timestamps
    end
  end

end
