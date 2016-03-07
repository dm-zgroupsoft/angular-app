class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.string :model, null: false, index: true
      t.float :size, null: false, index: true
      t.integer :response_time, index: true
      t.boolean :is_ips, null: false, default: false, index: true
      t.integer :price_cents, index: true

      t.references :manufacturer, index: true, null: false
      t.references :resolution, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :displays, :resolutions
    add_foreign_key :displays, :manufacturers
  end
end
