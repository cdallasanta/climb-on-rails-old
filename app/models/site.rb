class Site < ApplicationRecord
  has_many :users
  has_many :elements

  validates_presence_of :name

  def recent_comments
    Comment.where("created_at >= ?", 1.week.ago.utc).order(:element).select {|c| c.commentable.element.site == self}
  end
end
