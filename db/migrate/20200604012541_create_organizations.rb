class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :description
      t.string :industry
      t.boolean :interships, default: false
      t.boolean :jobs, default: false
      t.boolean :other_opportunities, default: false
      t.text :related_subjects
      t.text :related_activities
      t.text :related_soft_skills

      t.timestamps
    end
  end
end
