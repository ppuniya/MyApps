class CreatePuntingplayerstats < ActiveRecord::Migration
  def change
    create_table :puntingplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :pts
      t.integer :yds
      t.integer :avg
      t.integer :i20
      t.integer :lng

      t.timestamps
    end
  end
end
