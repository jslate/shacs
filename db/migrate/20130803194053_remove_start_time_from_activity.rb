class RemoveStartTimeFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :start_time
  end
end
