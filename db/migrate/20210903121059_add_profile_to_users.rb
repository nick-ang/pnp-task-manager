class AddProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :position, :integer
    add_column :users, :date_created, :datetime
    add_column :users, :date_modified, :datetime
    add_column :users, :phone, :integer
    add_column :users, :gender, :integer
  end
end
