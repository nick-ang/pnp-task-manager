class KanbanColumn < ApplicationRecord
  belongs_to :kanban
  has_many :tasks, dependent: :destroy
end
