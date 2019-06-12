class PreuseInspection::Setup < ApplicationRecord
  self.table_name = "setups"
  belongs_to :preuse_inspection
  has_many :user_setups, class_name: "JoinTable::UserSetups"
  has_many :users, through: :user_setups
  has_many :comments, as: :commentable
  has_one :element, through: :preuse_inspection

  after_create :default_to_false

  def default_to_false
    self.equipment_complete ||= false
    self.element_complete ||= false
    self.environment_complete ||= false
  end

  def is_complete?
    !self.attributes.any?(false)
  end
end
