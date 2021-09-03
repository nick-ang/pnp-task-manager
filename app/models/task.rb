class Task < ApplicationRecord
  belongs_to :project
  enum status: %i[not_started in_progress completed deleted]
  has_many :task_assigns, dependent: :destroy
  has_many :users, through: :task_assigns
end
