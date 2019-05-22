class PreuseInspection < ApplicationRecord
  has_many :climbs
  belongs_to :element
  belongs_to :user

  validates_presence_of :date
end
