class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, unique: true
      t.string :email, unique: true
      t.string :password_digest
      t.text :description
      t.string :industry
      t.boolean :interships, default: false
      t.boolean :jobs, default: false
      t.boolean :other_opportunities, default: false
      t.text :related_subjects
      t.text :related_activities
      t.text :related_soft_skills
      t.string :role, default: 'organization'


      t.timestamps
    end
  end
end
