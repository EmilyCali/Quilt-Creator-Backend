class Block < ApplicationRecord
  has_many :positions
  has_many :pieces, through: :positions
end
