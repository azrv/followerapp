class AddFollowersCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :followers_count, :integer, default: 0
    User.reset_column_information
    User.all.each do |user|
      User.update_counters user.id, followers_count: user.followers.length
    end
  end
end
