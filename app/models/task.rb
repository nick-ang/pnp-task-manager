class Task < ApplicationRecord
  enum status: %i[not_started in_progress completed deleted]
  enum priority: %i[high medium low]
  has_many :task_assigns, dependent: :destroy
  has_many :users, through: :task_assigns
  belongs_to :kanban_column
end
