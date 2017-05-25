class User < ApplicationRecord
  #validates that the username is unique and there
  validates :username, presence: true, uniqueness: true
  #validates that the password is there
  validates :password, presence: true
  #built in password securing
  has_secure_password
  #one to many relationship
  has_many :quilts

  #validates_associated :quilts
end
