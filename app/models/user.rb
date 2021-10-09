class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum position: %i[Project_manager Employee Administrator]
  enum gender: %i[Male Female]
  enum pay_due: %i[Yes No]
  enum pay_cycle: %i[Weekly Fortnightly Monthly]
  has_many :project_assigns, dependent: :destroy
  has_many :projects, through: :project_assigns
  has_many :kanbans, through: :projects
  has_many :kanban_columns, through: :kanbans
  has_many :tasks, through: :kanban_columns
  has_many :task_assigns, through: :tasks
  has_many :notes, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  # has_and_belongs_to_many :projects
end
