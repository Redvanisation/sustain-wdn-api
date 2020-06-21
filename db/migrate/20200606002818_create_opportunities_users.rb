class CreateOpportunitiesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities_users do |t|
      t.integer :opportunity_id
      t.integer :user_id
    end
    add_index("opportunities_users", ["opportunity_id", "user_id"], unique: true)
  end
end
