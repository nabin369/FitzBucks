Given(/^I am at the homepage$/) do
  visit root_path
end

When(/^I click "(.*?)"$/) do |button|
  click_link button
end

When(/^I fill in the following:$/) do |table|
  table.rows_hash.each do |field, value |
          fill_in field, :with => value
  end
  click_button "Create"
end

When(/^there is a Bet, Client, and Sport$/) do
  Bet.create(client_id: 1, sport_id: 1, stake: 101, returns: 201, settled_at: "2014-04-28")
  Client.create(id: 1, first_name: 'Stephen', last_name: 'Lloyd')
  Sport.create(id: 1, name: 'Football') 
end

Then(/^I should see Client with sport name$/) do
  @start_date = DateTime.parse('2014-04-27')
  @end_date =  DateTime.parse('2014-04-28') 
  @client_presenter = ProfitLossClientPresenter.present(@start_date, @end_date)
  @client_presenter.each do |key, client| 
      client.client_name.should eq('Stephen Lloyd')
      client.sport.each { |key, sport| sport.name.should eq('Football')}
  end
end

When(/^there is a Bet, Client$/) do
  Bet.create(client_id: 2, sport_id: 2, stake: 101, returns: 201, settled_at: "2014-04-28")
  Client.create(id: 2, first_name: 'Tom', last_name: 'League')
end

Then(/^I should see Client with sport name unknown$/) do
  @client_presenter.each do |key, clients| 
      clients.client_name.should eq('Tom League')
      clients.sport.each { |key, sports| sports.name.should eq('Unknown')}
  end
end

