class Setup < ApplicationRecord
  belongs_to :preuse_inspection
  has_many :users, through: :user_setups
  has_many :comments, as: :commentable
  has_one :element, through: :preuse_inspection

  def is_complete?
    !self.attributes.any?(false)
  end
end
