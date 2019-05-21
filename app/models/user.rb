class User < ApplicationRecord
  validates_presence_of :fullname
  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: {in: %w(facilitator lead admin)}
  has_secure_password
end
