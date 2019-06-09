class Element < ApplicationRecord
  belongs_to :site
  has_many :ropes
  has_many :preuse_inspections
  has_many :periodic_inspections

  validates_presence_of :name

  after_initialize :init

  def init
    #set default instructions here?
  end
end
