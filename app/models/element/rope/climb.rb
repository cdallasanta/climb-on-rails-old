class Rope::Climb < ApplicationRecord
  self.table_name = "climbs"
  belongs_to :rope, class_name: "Element::Rope"
  belongs_to :takedown
end
