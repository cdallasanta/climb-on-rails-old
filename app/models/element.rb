class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes, class_name: "Element::Rope"
  has_many :preuse_inspections
  has_many :periodic_inspections
  accepts_nested_attributes_for :ropes

  validates_presence_of :name
  validates_presence_of :site

  after_initialize :set_default_instructions

  @@DEFAULT_INSRUCTIONS = {
    setup_equipment_instructions: "All gear checked<br>Bad gear set aside",
    setup_element_instructions: "Everything appears normal<br>Backup halos not engaged",
    setup_environment_instructions: "Weather is appropriate for climbing<br>No widowmakers",
    takedown_equipment_instructions: "Gear stored properly<br>Helmets sprayed",
    takedown_element_instructions: "Access methods removed",
    takedown_environment_instructions: "Area clear of garbage",
    periodic_equipment_instructions: "All gear checked for rust and wear<br>No gear is over their age limit<br>Rescue bag checked and reflaked",
    periodic_element_instructions: "All QLs checked for wear<br>Belay and access cables showing no rust<br>Element climbed",
    periodic_environment_instructions: "Trees appear healthy, no loose or overhanging branches<br>Trail in good condition"
  }

  def set_default_instructions
    self.setup_equipment_instructions ||= @@DEFAULT_INSRUCTIONS[:setup_equipment_instructions]
    self.setup_element_instructions ||= @@DEFAULT_INSRUCTIONS[:setup_element_instructions]
    self.setup_environment_instructions ||= @@DEFAULT_INSRUCTIONS[:setup_environment_instructions]
    self.takedown_equipment_instructions ||= @@DEFAULT_INSRUCTIONS[:takedown_equipment_instructions]
    self.takedown_element_instructions ||= @@DEFAULT_INSRUCTIONS[:takedown_element_instructions]
    self.takedown_environment_instructions ||= @@DEFAULT_INSRUCTIONS[:takedown_environment_instructions]
    self.periodic_equipment_instructions ||= @@DEFAULT_INSRUCTIONS[:periodic_equipment_instructions]
    self.periodic_element_instructions ||= @@DEFAULT_INSRUCTIONS[:periodic_element_instructions]
    self.periodic_environment_instructions ||= @@DEFAULT_INSRUCTIONS[:periodic_environment_instructions]
    self.save
   end
end
