class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :tutor_request, index: true
      t.references :student_request, index: true
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
