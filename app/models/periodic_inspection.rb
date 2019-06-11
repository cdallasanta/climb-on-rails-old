class PeriodicInspection < ApplicationRecord
  belongs_to :element
  belongs_to :user
  has_many :comments, as: :commentable

  #validates date
end
