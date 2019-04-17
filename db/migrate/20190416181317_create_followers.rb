class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :followee_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
