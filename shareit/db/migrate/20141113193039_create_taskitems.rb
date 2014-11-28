class CreateTaskitems < ActiveRecord::Migration
  def change
    create_table :taskitems do |t|
      t.string :title
      t.string :description
      t.datetime :duedate
      t.integer :volunteer_id
      t.references :list, index: true

      t.timestamps
    end
  end
end
