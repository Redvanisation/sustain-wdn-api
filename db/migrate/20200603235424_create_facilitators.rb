class CreateFacilitators < ActiveRecord::Migration[6.0]
  def change
    create_table :facilitators do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
