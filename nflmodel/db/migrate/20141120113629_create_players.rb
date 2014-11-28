class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :playerid
      t.string :name
      t.datetime :started

      t.timestamps
    end
  end
end
