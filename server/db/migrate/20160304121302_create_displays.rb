class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.string :model, null: false
      t.float :size
      t.integer :response_time
      t.boolean :is_ips, null: false, default: false
      t.decimal :price
      t.references :manufacturer, index: true, null: false
      t.references :resolution, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :displays, :resolutions
    add_foreign_key :displays, :manufacturers
  end
end
