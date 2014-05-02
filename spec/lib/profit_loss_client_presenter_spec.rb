require 'spec_helper'

describe ProfitLossClientPresenter do
	let(:presenter) { ProfitLossClientPresenter.new }
        let(:bet1) { 
                   double('bet', :id => 1, :stake => 100, :returns => 200, :settled_at => 2014-04-27, :sport_id => 10,
                   :client => double('client', :id => 548, :first_name => 'Alfred', :last_name => 'Hanks'),
                   :sport => double('sport', :id => 10, :name => 'Football')) 
                  }

  context "#initialize" do
  	it "should initialize" do
  		presenter.total_stakes.should eq(0)
  	end
  end

	context "#add_bet" do

		it "should increase the total_stakes" do
     	presenter.total_stakes.should eq(0)

     	presenter.add_bet(bet1)
      presenter.total_stakes.should eq(100)
   	end

   	it "should increase the total_returns" do
      presenter.total_returns.should eq(0)

      presenter.add_bet(bet1)
     	presenter.total_returns.should eq(200)
   	end

    it "should increase the num_of_bets" do
      presenter.num_of_bets.should eq(0)

      presenter.add_bet(bet1)
      presenter.num_of_bets.should eq(1)
    end

    it "should set the first name of the client" do
      presenter.add_bet(bet1)
      presenter.first_name.should eq('Alfred')
    end

    it "should set the last name of the client" do
      presenter.add_bet(bet1)
      presenter.last_name.should eq('Hanks')
    end
  end

  context "#profit_loss" do
    it "should return profit and loss" do
    	presenter.add_bet(bet1)
   		presenter.profit_loss.should eq(100)
    end
  end

  context "#client_name" do
  	it "should return the name of the client name" do
    	presenter.add_bet(bet1)
    	presenter.client_name.should eq('Alfred Hanks')
  	end
  end
  
end



