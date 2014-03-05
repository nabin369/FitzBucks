class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :client_id
      t.integer :sport_id
      t.integer :stake
      t.string :result
      t.integer :returns
      t.datetime :settled_at

      t.timestamps
    end
  end
end
