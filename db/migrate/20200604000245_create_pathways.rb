class CreatePathways < ActiveRecord::Migration[6.0]
  def change
    create_table :pathways do |t|
      t.string :title
      t.text :subtitle
      t.text :description
      t.text :education_levels
      t.text :subjects
      t.text :activities
      t.text :soft_skills
      t.text :support_types
      t.boolean :primary, default: true

      t.timestamps
    end
  end
end
