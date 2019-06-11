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

  def is_lead?
    self.role == "lead"
  end

  def has_permissions?(level)
    case level
    when "admin"
      self.is_admin?
    when "lead"
      self.is_lead? || self.is_admin?
    end
  end
end
