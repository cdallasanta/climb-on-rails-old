class User < ApplicationRecord
  validates_presence_of :fullname
  validates :username, presence: true, uniqueness: true
  has_secure_password
end
