class Note < ApplicationRecord
  belongs_to :user
  enum colour: %i[#ffa9a9 #92f792 #ffff8e]
end
