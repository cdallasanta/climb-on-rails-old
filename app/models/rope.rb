class Rope < ApplicationRecord
  belongs_to :element
  has_many :climbs
  has_many :takedowns, through: :climbs

  validates_presence_of :identifier

  # returns the number of climbs this rope has received in its life
  # note: not the number of Climb objects, but the number of uses
  def climb_count
    self.climbs.inject(0){|sum, climb| sum + climb.number_of_climbs }
  end
end
