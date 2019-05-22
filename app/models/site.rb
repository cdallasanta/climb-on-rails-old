class Site < ApplicationRecord
  has_many :users
  has_many :elements

  validates_presence_of :name
end
