require_relative './profit_loss_module'

class ProfitLossClientSportPresenter

	include ProfitLoss

	attr_accessor :name

	class << self
		def presented(bet)
			presenter = {}

			bet.each do |bet|
				if bet.sport_id < 12				
					if presenter[bet.sport.id]
						presenter[bet.sport.id].add_bet(bet)
					else
						presenter[bet.sport.id] = ProfitLossClientSportPresenter.new
						presenter[bet.sport.id].add_bet(bet)
					end
				else
					presenter['unknown'] = ProfitLossClientSportPresenter.new
					presenter['unknown'].add_bet(bet)
				end
			end
			presenter
		end
	end

	def initialize 
		@total_stakes 	= 0
		@total_returns 	= 0
		@num_of_bets   	= 0
	end

	def add_bet(bet)
		@total_stakes 	+= bet.stake
		@total_returns	+= bet.returns
		@num_of_bets 	+= 1
		if bet.sport_id < 12
			@name = bet.sport.name
		else
			@name = 'Unknown'
		end
	end

	# def sport_name
	# 	"#{sport_name}"
	# end
end