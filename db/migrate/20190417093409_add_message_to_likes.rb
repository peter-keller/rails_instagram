class AddMessageToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :message, :string
  end
end
