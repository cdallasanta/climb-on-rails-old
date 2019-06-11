class Inspection::PeriodicInspection < ApplicationRecord
  self.table_name = "periodic_inspections"
  belongs_to :element
  belongs_to :user
  has_many :comments, as: :commentable

  #validates date
end
