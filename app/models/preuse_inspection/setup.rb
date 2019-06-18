class PreuseInspection::Setup < ApplicationRecord
  self.table_name = "setups"
  belongs_to :preuse_inspection
  has_many :user_setups, class_name: "JoinTable::UserSetups"
  has_many :users, through: :user_setups
  has_many :comments, as: :commentable
  has_one :element, through: :preuse_inspection
  accepts_nested_attributes_for :comments

  after_create :default_to_false

  def default_to_false
    self.equipment_complete ||= false
    self.element_complete ||= false
    self.environment_complete ||= false
    self.save
  end

  def is_complete?
    !self.attributes.any?{|attr, val| val == false}
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
end
