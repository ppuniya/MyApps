class CreateGamescoresummaries < ActiveRecord::Migration
  def change
    create_table :gamescoresummaries do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.string :scoretype
      t.string :desc
      t.integer :qtr

      t.timestamps
    end
  end
end
