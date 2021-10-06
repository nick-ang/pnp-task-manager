class AddToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :duration, :integer
  end
end
