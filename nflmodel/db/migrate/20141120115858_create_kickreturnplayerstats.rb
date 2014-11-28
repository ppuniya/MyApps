class CreateKickreturnplayerstats < ActiveRecord::Migration
  def change
    create_table :kickreturnplayerstats do |t|
      t.integer :ret
      t.integer :avg
      t.integer :tds
      t.integer :lng
      t.integer :lngtd
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
