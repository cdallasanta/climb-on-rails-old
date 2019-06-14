class PreuseInspection::Takedown < ApplicationRecord
  self.table_name = "takedowns"
  belongs_to :preuse_inspection
  has_many :user_takedowns, class_name: "JoinTable::UserTakedowns"
  has_many :users, through: :user_takedowns
  has_many :climbs, class_name: "Element::Rope::Climb"
  has_many :comments, as: :commentable
  has_many :ropes, through: :preuse_inspection, class_name: "Element::Rope"
  accepts_nested_attributes_for :ropes

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

  def update_everything(params)
    self.update_checkboxes(params.except(:ropes_attributes, :id))
    self.update_climbs(params[:ropes_attributes])
  end

  def update_checkboxes(checkbox_params)
    self.update(checkbox_params)
  end

  def update_climbs(params)
    params.each do |i, rope_attributes|
      rope_obj = Element::Rope.find_by(id:rope_attributes[:id], element:self.preuse_inspection.element)

      rope_attributes[:climbs_attributes].each do |block_num, last_hash|
        climb = rope_obj.climbs.find_or_create_by(climbing_block:(block_num.to_i+1), takedown_id: self.id)
        climb_num = last_hash[:number_of_climbs].to_i
        #only updates if the numbers are different, to reduce changes to the database
        if climb.number_of_climbs != climb_num
          climb.update(number_of_climbs: climb_num)
        end
      end
    end
  end
end
