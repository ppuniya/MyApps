class CreateDefenseplayerstats < ActiveRecord::Migration
  def change
    create_table :defenseplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :tkl
      t.integer :ast
      t.integer :sk
      t.integer :int
      t.integer :ffum

      t.timestamps
    end
  end
end
