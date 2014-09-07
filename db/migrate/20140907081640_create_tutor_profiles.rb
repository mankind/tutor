class CreateTutorProfiles < ActiveRecord::Migration
  def change
    create_table :tutor_profiles do |t|
      t.references :user, index: true
      t.string :university
      t.string :degree_subject
      t.string :teaching_subject
      t.string :location
      t.string :about_myself
      t.text :tutoring_approach
      t.text :teaching_experience
      t.text :extracurricular_interests

      t.timestamps
    end
  end
end
