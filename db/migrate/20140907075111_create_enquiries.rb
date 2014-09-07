class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :subject
      t.string :level
      t.string :location
      t.string :duration
      t.string :start_date
      t.string :tuition_fee
      t.text :note
      t.references :user, index: true
      t.integer :availability

      t.timestamps
    end
  end
end
