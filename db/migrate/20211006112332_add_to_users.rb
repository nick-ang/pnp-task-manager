class AddToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :salary, :integer
    add_column :users, :pay_cycle, :integer
    add_column :users, :pay_due, :integer
    add_column :users, :birthdate, :datetime
    add_column :users, :employee_number, :integer
    add_column :users, :tfn, :integer
    add_column :users, :bank_account, :integer
    add_column :users, :bank_bsb, :integer
    add_column :users, :start_date, :integer
  end
end
