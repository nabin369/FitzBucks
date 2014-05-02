require 'spec_helper'

describe ProfitLossClientSportPresenter do
			
		let(:presenter)	{ ProfitLossClientSportPresenter.new }
		let(:bet) { double('bet', :stake => 100, :returns => 200, :settled_at => 2014-04-25, :sport_id => 10,
                    :client => double('client', :id => 548, :first_name => 'Alfred', :last_name => 'Hanks'),
                    :sport => double('sport', :id => 10, :name => 'Football')) 
                  }
	
	context "#initialize" do
		it 'should initialize with the class' do
			presenter.total_stakes.should eq(0)
			presenter.total_returns.should eq(0)
		end
	end

	context "#add_sport" do
		it 'should return total_stakes' do
			presenter.add_bet(bet)
			presenter.total_stakes.should eq(100)
		end

		it 'should return total_returns' do
			presenter.add_bet(bet)
			presenter.total_returns.should eq(200)
		end

		it 'should return total bet' do
			presenter.add_bet(bet)
			presenter.num_of_bets.should eq(1)
		end
	end

	context "#sport_profit_loss" do
		it 'should return profit_loss' do
			presenter.add_bet(bet)
			presenter.profit_loss.should eq(100)
		end
	end

	context "#sport_name" do
		it 'should return name of the sport' do
			presenter.add_bet(bet)
			presenter.name.should eq('Football')
		end
	end
end