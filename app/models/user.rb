class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :site
  has_many :user_periodic_inspections, class_name: "JoinTable::UserPeriodicInspections"
  has_many :periodic_inspections, through: :user_periodic_inspections
  has_many :user_setups, class_name: "JoinTable::UserSetups"
  has_many :setups, through: :user_setups
  has_many :user_takedowns, class_name: "JoinTable::UserTakedowns"
  has_many :takedowns, through: :user_takedowns
  has_many :comments
  

  #  this is a placeholder for development, and should be removed when admins can create users
  after_initialize :set_defaults

  def set_defaults
    self.site = Site.find_by(name:"Orkila")
    self.role = "lead"
    self.save
  end

  def is_admin?
    self.role == "admin"
  end

  def has_permissions?(level)
    case level
    when "admin"
      self.role == "admin"
    when "lead"
      self.role == "lead" || self.role == "admin"
    end
  end
end