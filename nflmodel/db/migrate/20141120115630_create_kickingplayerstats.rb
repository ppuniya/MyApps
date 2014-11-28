class CreateKickingplayerstats < ActiveRecord::Migration
  def change
    create_table :kickingplayerstats do |t|
      t.references :game, index: true
      t.references :team, index: true
      t.references :player, index: true
      t.integer :fgm
      t.integer :fga
      t.integer :fgyds
      t.integer :totpfg
      t.integer :xpmade
      t.integer :xpmissed
      t.integer :xpa
      t.integer :xpb
      t.integer :xptot

      t.timestamps
    end
  end
end
