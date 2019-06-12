class PreuseInspection < ApplicationRecord
  self.table_name = "preuse_inspections"
  belongs_to :element
  has_many :ropes, through: :element
  has_one :setup, class_name: "PreuseInspection::Setup"
  has_one :takedown, class_name: "PreuseInspection::Takedown"

  validates_presence_of :date
  validates_presence_of :element

  def self.find_or_create_todays_inspection(element_id)
    self.where(date:Date.today.strftime("%Y-%m-%d") , element: Element.find(element_id)).first_or_create
  end
end
