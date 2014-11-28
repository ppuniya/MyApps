class CreateGamedriveplays < ActiveRecord::Migration
  def change
    create_table :gamedriveplays do |t|
      t.references :gamedrive, index: true
      t.integer :sp
      t.integer :qtr
      t.integer :down
      t.integer :starttime
      t.integer :yrdln
      t.integer :ydstogo
      t.integer :ydsnet
      t.string :desc
      t.string :note

      t.timestamps
    end
  end
end
