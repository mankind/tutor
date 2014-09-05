class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :subject
      t.string :level
      t.string :location
      t.datetime :start_date
      t.string :duration
      t.text :note
      t.references :user, index: true

      t.timestamps
    end
  end
end
