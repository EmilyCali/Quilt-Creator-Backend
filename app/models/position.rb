class Position < ApplicationRecord
  belongs_to :block
  belongs_to :piece
end
