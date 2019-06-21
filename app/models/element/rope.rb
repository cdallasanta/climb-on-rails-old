class Element::Rope < ApplicationRecord
  self.table_name = "ropes"
  belongs_to :element
  has_many :climbs, class_name: "Element::Rope::Climb"
  has_many :preuse_inspections, through: :element
  accepts_nested_attributes_for :climbs

  validates_presence_of :identifier
  validates_presence_of :element

  after_create :not_retired

  def not_retired
    self.retired ||= false
  end

  # returns the number of climbs this rope has received in its life
  # note: not the number of Climb objects, but the number of uses
  def climb_count
    self.climbs.inject(0) do |sum, climb|
      if climb.number_of_climbs
        sum + climb.number_of_climbs
      end
    end
  end
end
