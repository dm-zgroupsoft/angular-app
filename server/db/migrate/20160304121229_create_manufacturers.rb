class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :title, null: false

      t.timestamps null: false
    end

  end
end
