class PeriodicInspection < ApplicationRecord
  belongs_to :element
  belongs_to :user
  #has comments, polymorphism
end
