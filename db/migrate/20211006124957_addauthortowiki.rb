class Addauthortowiki < ActiveRecord::Migration[6.1]
  def change
    add_column :wikis, :author, :string
  end
end
