class Site < ApplicationRecord
  has_many :users
  has_many :elements

  validates_presence_of :name

  def self.recent_comments(site)
    Comment.where("created_at >= ?", 1.week.ago.utc).order(:element)
  end
end
