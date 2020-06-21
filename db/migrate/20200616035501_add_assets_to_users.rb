class AddAssetsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :greatest_assets, :text
    add_column :users, :greatest_challenges, :text
  end
end
