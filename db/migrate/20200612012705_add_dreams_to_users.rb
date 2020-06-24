class AddDreamsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :life_dream, :text
    add_column :users, :community_dream, :text
    add_column :users, :world_dream, :text
  end
end
