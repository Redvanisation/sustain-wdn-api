class CreateFacilitators < ActiveRecord::Migration[6.0]
  def change
    create_table :facilitators do |t|
      t.string :name, unique: true
      t.string :email, unique: true
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :role, default: 'facilitator'

      t.timestamps
    end
  end
end
