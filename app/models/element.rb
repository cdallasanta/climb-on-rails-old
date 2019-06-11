class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes
  has_many :preuse_inspections
  has_many :periodic_inspections

  validates_presence_of :name
  validates_presence_of :site

  #TODO figure out how to deal with default instructions.
end
