class Rope < ApplicationRecord
  belongs_to :element

  validates_presence_of :identifier

  # returns the number of climbs this rope has received in its life
  # note: not the number of Climb object, but the number of uses
  # TODO, there's probably a better method, maybe something like #sum or #total that
  # can accept a block? Or #collect?
  def climb_count
    sum = 0
    self.climbs.each { |climb| sum += climb.number_of_climbs}
    sum
  end
end
