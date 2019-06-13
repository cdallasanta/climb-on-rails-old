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

  def update_everything(params)
    self.update_checkboxes(params.except(:ropes))
    self.update_climbs(params[:ropes])
  end

  def update_checkboxes(checkbox_params)
    self.update(checkbox_params)
  end

  def update_climbs(params)
    params.each do |rope, climbs|
      rope_obj = Element::Rope.find_by(identifier:rope, element:self.preuse_inspection.element)

      climbs.each do |block_num, climb_num|
        climb = rope_obj.climbs.find_or_create_by(climbing_block:(block_num.to_i), takedown_id: self.id)

        #only updates if the numbers are different, to reduce changes to the database
        if climb.number_of_climbs != climb_num.to_i
          climb.update(number_of_climbs: climb_num.to_i)
        end
      end
    end
  end
end
