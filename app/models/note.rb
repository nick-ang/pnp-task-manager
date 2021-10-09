class Note < ApplicationRecord
  belongs_to :user
  enum colour: %i[#f96969 #92f792 #ffff8e]
end
