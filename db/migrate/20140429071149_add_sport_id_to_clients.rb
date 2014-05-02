class AddSportIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :sport_id, :integer
  end
end
