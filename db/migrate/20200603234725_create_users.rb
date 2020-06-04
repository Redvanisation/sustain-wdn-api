class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :educartion_level
      t.string :fav_subjects
      t.string :fav_activities
      t.string :soft_skills
      t.string :support_types
      t.integer :eager_scale
      t.integer :facilitator_id

      t.timestamps
    end
  end
end
