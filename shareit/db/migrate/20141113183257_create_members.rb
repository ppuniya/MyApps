class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :board, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
