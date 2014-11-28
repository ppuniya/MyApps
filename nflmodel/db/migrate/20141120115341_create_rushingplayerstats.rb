class CreateRushingplayerstats < ActiveRecord::Migration
  def change
    create_table :rushingplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :att
      t.integer :yds
      t.integer :tds
      t.integer :lng
      t.integer :lngtd
      t.integer :twopta
      t.integer :twoptm

      t.timestamps
    end
  end
end
