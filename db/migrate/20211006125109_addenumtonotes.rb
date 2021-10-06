class Addenumtonotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :colour, :integer
  end
end
