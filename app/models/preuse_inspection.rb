class PreuseInspection < ApplicationRecord
  belongs_to :element
  has_many :ropes, through: :element
  has_one :setup
  has_one :takedown

  validates_presence_of :date
  validates_presence_of :element
end
