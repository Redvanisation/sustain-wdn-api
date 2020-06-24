class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, unique: true
      t.string :email, unique: true
      t.string :password_digest
      t.string :education_level
      t.string :fav_subjects
      t.string :fav_activities
      t.string :soft_skills
      t.string :support_types
      t.integer :eager_scale
      t.string :active_pathway
      t.string :role, default: 'user'

      t.timestamps
    end
  end
end
