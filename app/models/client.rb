class Client < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :bets
end
