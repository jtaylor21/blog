class RemoveScreenNameFromTweet < ActiveRecord::Migration
  def up
    remove_column :tweets, :screen_name
      end

  def down
    add_column :tweets, :screen_name, :string
  end
end
