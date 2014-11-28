class CreateTeamstats < ActiveRecord::Migration
  def change
    create_table :teamstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.string :teamtype
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :q5
      t.integer :total
      t.integer :to
      t.integer :totfd
      t.integer :totyds
      t.integer :pyds
      t.integer :ryds
      t.integer :pen
      t.integer :penyds
      t.integer :trnovr
      t.integer :pt
      t.integer :ptyds
      t.integer :ptavg
      t.integer :top

      t.timestamps
    end
  end
end
