class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :listtype
      t.text :description

      t.timestamps
    end
  end
end
