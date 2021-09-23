class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum position: %i[project_manager employee administrator]
  enum gender: %i[male female]
  has_many :project_assigns, dependent: :destroy
  has_many :projects, through: :project_assigns
  has_many :kanbans, through: :projects
  has_many :kanban_columns, through: :kanbans
  has_many :tasks, through: :kanban_columns
  has_many :notes
  has_many :notifications, as: :recipient, dependent: :destroy
  # has_and_belongs_to_many :projects
end
