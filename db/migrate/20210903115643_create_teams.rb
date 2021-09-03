class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.datetime :date_created
      t.datetime :date_modified
      t.string :created_by

      t.timestamps
    end
  end
end
