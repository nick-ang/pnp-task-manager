class RemoveStringfromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :datetime
  end
end
