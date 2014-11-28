class CreatePassingplayerstats < ActiveRecord::Migration
  def change
    create_table :passingplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :att
      t.integer :cmp
      t.integer :yds
      t.integer :tds
      t.integer :ints
      t.integer :twopta
      t.integer :twoptm

      t.timestamps
    end
  end
end
