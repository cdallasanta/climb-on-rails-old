class PeriodicInspection < ApplicationRecord
  belongs_to :element
  has_many :user_periodic_inspections, class_name: "JoinTable::UserPeriodicInspections"
  has_many :users, through: :user_periodic_inspections
  has_many :comments, as: :commentable

  validates_presence_of :date
  validates_presence_of :element

  def self.find_or_create_by_date(element, date)
    self.where(date: Date.strptime(date, "%Y-%m-%d"), element: element).first_or_create
  end
end
