class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :progress
      t.datetime :end_date
      t.datetime :start_date
      t.integer :status
      t.datetime :date_created
      t.string :date_modified
      t.string :datetime

      t.timestamps
    end
  end
end
