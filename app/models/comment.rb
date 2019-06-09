class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  #something about polymorphism with it's parent inspection
end
