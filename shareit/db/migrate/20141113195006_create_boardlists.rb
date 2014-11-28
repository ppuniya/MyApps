class CreateBoardlists < ActiveRecord::Migration
  def change
    create_table :boardlists do |t|
      t.string :perms
      t.integer :listposition
      t.integer :board_id
      t.integer :list_id

      t.timestamps
    end
  end
end
