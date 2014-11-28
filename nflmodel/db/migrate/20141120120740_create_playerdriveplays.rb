class CreatePlayerdriveplays < ActiveRecord::Migration
  def change
    create_table :playerdriveplays do |t|
      t.references :gamedriveplay, index: true
      t.references :player, index: true
      t.references :team, index: true
      t.integer :statid
      t.integer :yards

      t.timestamps
    end
  end
end
