class Inspection::PreuseInspection < ApplicationRecord
  self.table_name = "preuse_inspections"
  belongs_to :element
  has_many :ropes, through: :element
  has_one :setup, class_name: "Inspection::PreuseInspection::Setup"
  has_one :takedown, class_name: "Inspection::PreuseInspection::Takedown"

  validates_presence_of :date
  validates_presence_of :element
end
