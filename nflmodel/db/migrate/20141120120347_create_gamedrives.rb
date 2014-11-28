class CreateGamedrives < ActiveRecord::Migration
  def change
    create_table :gamedrives do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.integer :qtr
      t.boolean :redzone
      t.integer :fds
      t.string :result
      t.integer :penyds
      t.integer :ydsgained
      t.integer :numplays
      t.integer :postime
      t.integer :starttime
      t.integer :endtime
      t.integer :startpos
      t.integer :endpos

      t.timestamps
    end
  end
end
