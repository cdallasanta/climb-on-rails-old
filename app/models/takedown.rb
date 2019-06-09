class Takedown < ApplicationRecord
  belongs_to :preuse_inspection
  belongs_to :user
  has_many :climbs
  has_many :ropes, through: :climbs
end
