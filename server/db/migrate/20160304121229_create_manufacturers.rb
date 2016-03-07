class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :title, index: true, null: false

      t.timestamps null: false
    end

    add_index :manufacturers, :title, :unique => true
  end
end
