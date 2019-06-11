class User < ApplicationRecord
  belongs_to :site
  has_many :periodic_inspections
  has_many :setups
  has_many :takedowns
  #has_many comments, something about polymorphism

  validates_presence_of :fullname
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: {in: %w(facilitator lead admin)}
  has_secure_password

  def is_admin?
    self.role == "admin"
  end
end
