class JoinTables::UserSetups < ApplicationRecord
  belongs_to :user
  belongs_to :setup
end
