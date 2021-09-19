class CreateWikis < ActiveRecord::Migration[6.1]
  def change
    create_table :wikis do |t|
      t.text :description
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
