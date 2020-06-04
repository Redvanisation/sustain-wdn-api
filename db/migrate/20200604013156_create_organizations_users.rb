class CreateOrganizationsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations_users do |t|
      t.integer :organization_id
      t.integer :user_id
    end
    add_index("organizations_users", ["organization_id", "user_id"], unique: true)
  end
end
