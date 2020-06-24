class CreatePathwaysUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :pathways_users do |t|
      t.integer :pathway_id
      t.integer :user_id
    end
    add_index("pathways_users", ["pathway_id", "user_id"], unique: true)
  end
end
