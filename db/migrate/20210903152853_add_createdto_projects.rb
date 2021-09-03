class AddCreatedtoProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :user, index: true
  end
end
