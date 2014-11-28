class CreateReceivingplayerstats < ActiveRecord::Migration
  def change
    create_table :receivingplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :rec
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
