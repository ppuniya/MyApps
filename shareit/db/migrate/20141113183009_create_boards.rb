class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.string :description
      t.string :boardtype
      t.references :user, index: true

      t.timestamps
    end
  end
end
