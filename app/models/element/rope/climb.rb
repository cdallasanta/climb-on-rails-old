class Element::Rope::Climb < ApplicationRecord
  self.table_name = "climbs"
  belongs_to :rope, class_name: "Element::Rope"
  belongs_to :takedown, class_name: "PreuseInspection::Takedown"
  after_initialize :init

  def init
    number_of_climbs ||= 0
  end
end
