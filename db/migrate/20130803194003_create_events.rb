class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :activity_id
      t.integer :user_id
      t.datetime :start_time
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
