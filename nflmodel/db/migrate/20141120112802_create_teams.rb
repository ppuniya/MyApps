class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :abbr
      t.string :city
	  t.string :teamname
      t.datetime :estd
      t.string :conf
      t.string :div
	  t.string :website

      t.timestamps
    end
  end
end
