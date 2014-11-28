class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.references :board, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
