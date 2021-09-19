class Project < ApplicationRecord
  enum status: %i[not_started in_progress completed deleted]
  has_many :project_assigns, dependent: :destroy
  has_many :users, through: :project_assigns
  has_many :tasks
  # has_and_belongs_to_many :users
end
