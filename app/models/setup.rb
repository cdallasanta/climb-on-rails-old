class Setup < ApplicationRecord
  belongs_to :preuse_inspection
  belongs_to :user
  has_many :comments, as: :commentable
  has_one :element, through: :preuse_inspection
end
