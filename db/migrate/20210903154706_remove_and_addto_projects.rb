class RemoveAndAddtoProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :created_by, :integer
    remove_column :projects, :user_id
  end
end
