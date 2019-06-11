class JoinTables::UserTakedowns < ApplicationRecord
  belongs_to :user
  belongs_to :takedown
end
