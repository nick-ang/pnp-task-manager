class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :description
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :color

      t.timestamps
    end
  end
end
