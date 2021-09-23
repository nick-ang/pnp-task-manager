class Chatroom < ApplicationRecord
  has_many :chatroom_assigns, dependent: :destroy
  has_many :users, through: :chatroom_assigns
  has_many :messages, dependent: :destroy
  # has_and_belongs_to_many :users
end
