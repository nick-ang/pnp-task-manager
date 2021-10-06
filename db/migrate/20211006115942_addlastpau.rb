class Addlastpau < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_pay, :datetime
  end
end
