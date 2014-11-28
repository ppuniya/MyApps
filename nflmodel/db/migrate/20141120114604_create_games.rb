class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :gameid
      t.string :gametype
	  t.string :weather
      t.string :media
      t.string :yl
      t.string :qtr
      t.string :note
      t.integer :down
      t.integer :togo
      t.boolean :redzone
      t.integer :clock
      t.string :posteam
      t.string :stadium
	  t.date :gamedate

      t.timestamps
    end
  end
end
