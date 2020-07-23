class CreatePathways < ActiveRecord::Migration[6.0]
  def change
    create_table :pathways do |t|
      t.string :title
      t.text :description
      t.text :responsibilities
      t.text :qualifications
      t.string :salary
      t.text :links
      t.text :education_levels
      t.text :subjects
      t.text :activities
      t.text :soft_skills
      t.text :support_types
      t.text :work_best
      t.text :people_see
      t.boolean :primary, default: true

      t.timestamps
    end
  end
end
