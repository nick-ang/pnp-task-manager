class AddcreateToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :created_by, :string
  end
end
