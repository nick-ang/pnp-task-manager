class AddKanbanToProjects2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :kanbans, :project, index: true
    add_foreign_key :kanbans, :projects
    # remove_column :projects, :kanban_id
  end
end
