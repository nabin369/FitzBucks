class Bet < ActiveRecord::Base
  attr_accessible :client_id, :result, :returns, :settled_at, :sport_id, :stake
  belongs_to :client
  belongs_to :sport
end
