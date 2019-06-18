class PeriodicInspection < ApplicationRecord
  belongs_to :element
  has_many :user_periodic_inspections, class_name: "JoinTable::UserPeriodicInspections"
  has_many :users, through: :user_periodic_inspections
  has_many :comments, as: :commentable

  validates_presence_of :date
  validates_presence_of :element

end
