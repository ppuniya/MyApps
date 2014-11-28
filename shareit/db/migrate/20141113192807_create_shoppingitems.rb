class CreateShoppingitems < ActiveRecord::Migration
  def change
    create_table :shoppingitems do |t|
      t.string :name
      t.string :details
      t.float :unitcost
      t.float :quantity
      t.string :unittype
	  t.string :beststore
      t.float :minunitprice
	  t.references :list, index: true

      t.timestamps
    end
  end
end
