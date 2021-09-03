class CreateTaskAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :task_assigns do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date_created
      t.datetime :date_modified

      t.timestamps
    end
  end
end
