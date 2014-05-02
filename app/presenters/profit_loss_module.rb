module ProfitLoss
	attr_accessor :total_stakes, :total_returns, :num_of_bets

	def profit_loss
		@total_returns - @total_stakes
	end
end