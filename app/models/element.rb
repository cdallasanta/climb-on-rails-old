class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes, class_name: "Element::Rope"
  has_many :preuse_inspections, class_name: "Inspection::PreuseInspection"
  has_many :periodic_inspections, class_name: "Inspection::PeriodicInspection"

  validates_presence_of :name
  validates_presence_of :site

  #TODO figure out how to deal with default instructions.

  def date_of_last_periodic
    #TODO make this
  end
end
