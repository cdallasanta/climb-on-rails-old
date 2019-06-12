class PeriodicInspection < ApplicationRecord
  belongs_to :element
  belongs_to :user
  has_many :comments, as: :commentable

  validates_presence_of :date
  validates_presence_of :element

end
