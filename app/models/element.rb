class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes
  has_many :climbs
  has_many :preuse_inspections

  validates_presence_of :name
end
