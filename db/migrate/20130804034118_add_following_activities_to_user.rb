class AddFollowingActivitiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :following_activities, :integer, array: true, default: '{}'
  end
end
