class QuiltBlock < ApplicationRecord
  belongs_to :user, optional: true
end
