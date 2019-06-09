class User < ApplicationRecord
  belongs_to :site
  has_many :preuse_inspections

  validates_presence_of :fullname
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: {in: %w(facilitator lead admin)}
  has_secure_password
end
