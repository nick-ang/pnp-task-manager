class Kanban < ApplicationRecord
  has_many :kanban_columns, dependent: :destroy
  has_many :tasks, through: :kanban_columns
  belongs_to :project
end
