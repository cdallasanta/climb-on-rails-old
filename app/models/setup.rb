class Setup < ApplicationRecord
  belongs_to :preuse_inspection
  belongs_to :user
  has_many :comments, as: :commentable
end
