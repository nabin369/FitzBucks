namespace :db do
  desc "Reset the database with Test Data"
  task :populate => :environment do
    require 'faker'
    require 'populator'

    [Bet, Client, Sport].map(&:delete_all)

    Client.populate 600 do |client|
      client.first_name = Faker::Name.first_name
      client.last_name  = Faker::Name.last_name
    end

    Sport.create(:name => "Football")
    Sport.create(:name => "Horse Racing (UK)")
    Sport.create(:name => "Horse Racing (ROI)")
    Sport.create(:name => "Horse Racing (Int)")
    Sport.create(:name => "Greyhounds")
    Sport.create(:name => "Tennis")
    Sport.create(:name => "Rugby Union")
    Sport.create(:name => "Darts")
    Sport.create(:name => "American Football")
    Sport.create(:name => "Golf")
    Sport.create(:name => "Cricket")

    # Start date Jan 1 2014
    base_date = Date.new(2014, 1, 1)
    Bet.populate 39000 do |bet|
      bet.stake     = rand(1..9999)
      bet.result    = ["win", "lose"][rand(0..1)]

      if bet.result == "win"
        bet.returns = rand(1..9999) + bet.stake
      else
        bet.returns = 0
      end

      bet.sport_id  = rand(1..12)
      bet.client_id = rand(1..600)

      created_day = rand(1..180)
      bet.created_at = base_date + created_day.day
      bet.settled_at = base_date + rand(1..created_day).day
    end
  end
end
