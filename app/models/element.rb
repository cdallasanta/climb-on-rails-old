class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes, class_name: "Element::Rope"
  has_many :preuse_inspections, class_name: "Inspection::PreuseInspection"
  has_many :periodic_inspections, class_name: "Inspection::PeriodicInspection"

  validates_presence_of :name
  validates_presence_of :site

  after_create :default_instructions

  #TODO figure out how to deal with default instructions.

  def default_instructions
    #TODO, this is filler until I work on elements/new
    self.preuse_equipment_instructions ||= "preuse_equipment_instructions filler"
    self.preuse_element_instructions ||= "preuse_element_instructions filler"
    self.preuse_environment_instructions ||= "preuse_environment_instructions filler"
    self.periodic_equipment_instructions ||= "periodic_equipment_instructions filler"
    self.periodic_element_instructions ||= "periodic_element_instructions filler"
    self.periodic_environment_instructions ||= "periodic_environment_instructions filler"
    self.save
   end

  def date_of_last_periodic
    #TODO make this
  end
end
