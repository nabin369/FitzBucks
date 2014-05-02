require_relative './profit_loss_client_sport_presenter'
require_relative './profit_loss_module'

class ProfitLossClientPresenter

  include ProfitLoss

  attr_accessor :num_of_winners, :first_name, :last_name, :sport_bet, :sport

  class << self
    def present(start_date, end_date)
      presenters = {}
      bets = Bet.where("settled_at BETWEEN ? AND ?",
                        start_date.beginning_of_day,
                        end_date.end_of_day)

      bets.each do |bet|
        if presenters[bet.client.id]
          presenters[bet.client.id].add_bet(bet)
        else
          presenters[bet.client.id] = ProfitLossClientPresenter.new
          presenters[bet.client.id].add_bet(bet)
        end
      end
      presenters
    end
  end

  def initialize
    @total_stakes   = 0
    @total_returns  = 0
    @num_of_bets    = 0
    @num_of_winners = 0
    @sport_bet      = []
  end

  def add_bet(bet)
    @total_stakes   += bet.stake
    @total_returns  += bet.returns
    @num_of_bets    += 1
    @num_of_winners += 1 if bet.returns > 0
    @first_name      = bet.client.first_name
    @last_name       = bet.client.last_name
    @sport_bet      << bet
    sport_presenter(sport_bet)
  end

  def sport_presenter(bets)
    @sport           = ProfitLossClientSportPresenter.presented(bets)
  end

  def client_name
    "#{@first_name} #{@last_name}"
  end

end
