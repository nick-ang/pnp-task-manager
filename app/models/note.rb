class Note < ApplicationRecord
  belongs_to :user
  enum colour: %i[Red Yellow Green]
end
