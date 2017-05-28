class Piece < ApplicationRecord
  has_many :positions
  has_many :blocks, through: :positions
end
