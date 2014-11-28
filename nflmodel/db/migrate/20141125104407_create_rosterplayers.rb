class CreateRosterplayers < ActiveRecord::Migration
  def change
    create_table :rosterplayers do |t|
      t.string :fname
      t.string :lname
      t.string :pos
      t.string :status
      t.integer :jersey
      t.string :hgt
      t.integer :wgt
      t.date :bday
      t.integer :exp
      t.string :college
      t.references :team, index: true
      t.references :player, index: true

      t.timestamps
    end
  end
end
