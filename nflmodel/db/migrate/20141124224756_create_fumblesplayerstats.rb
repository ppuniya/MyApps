class CreateFumblesplayerstats < ActiveRecord::Migration
  def change
    create_table :fumblesplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :tot
      t.integer :rcv
      t.integer :trcv
      t.integer :yds
      t.integer :lost

      t.timestamps
    end
  end
end
