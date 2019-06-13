class PreuseInspection::Takedown < ApplicationRecord
  self.table_name = "takedowns"
  belongs_to :preuse_inspection
  has_many :user_takedowns, class_name: "JoinTable::UserTakedowns"
  has_many :users, through: :user_takedowns
  has_many :climbs, class_name: "Element::Rope::Climb"
  has_many :comments, as: :commentable

  after_create :default_to_false

  def default_to_false
    self.equipment_complete ||= false
    self.element_complete ||= false
    self.environment_complete ||= false
    self.save
  end

  def will_change?(params)
    params.to_h.any? do |attr, val|
      self.attributes[attr] != !val.to_i.zero?
      # e.g.
      # equipment_complete == false, and new equipment_complete == "1" would work out to:
      # false != !(1.zero?)
      # false != true => true, which means the value is changing
    end
  end

  def ropes
    self.preuse_inspection.ropes
  end
end
