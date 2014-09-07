class CreateTutorships < ActiveRecord::Migration
  def change
    create_table :tutorships do |t|
      t.references :tutor, index: true
      t.references :student, index: true
      t.integer :status, default: 0
      t.text :message
      t.string :subject

      t.timestamps
    end
  end
end
