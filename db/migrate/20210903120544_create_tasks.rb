class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :status
      t.datetime :date_created
      t.datetime :date_modified
      t.integer :position
      t.references :kanban_column, null: false, foreign_key: true
      t.timestamps
    end
  end
end
