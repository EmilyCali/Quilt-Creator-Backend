class User < ApplicationRecord
  #validates that the username is unique and there
  validates :username, presence: true, uniqueness: true
  #validates that the password is there
  validates :password, presence: true
  #built in password securing
  has_secure_password
  #one to many relationship
  #has_many :quilts

  #makes it so that there is a relationship and when a user is destroyed so too should be the quilt_blocks
  has_many :quilt_blocks, dependent: :destroy
  #validates_associated :quilts
end
