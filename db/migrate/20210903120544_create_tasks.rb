class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :status
      t.datetime :date_created
      t.datetime :date_modified

      t.timestamps
    end
  end
end
