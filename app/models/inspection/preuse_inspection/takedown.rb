class PreuseInspection::Takedown < ApplicationRecord
  self.table_name = "takedowns"
  belongs_to :preuse_inspection
  has_many :users, through: :user_takedowns
  has_many :climbs
  has_many :ropes, through: :preuse_inspection
  has_many :comments, as: :commentable
end
