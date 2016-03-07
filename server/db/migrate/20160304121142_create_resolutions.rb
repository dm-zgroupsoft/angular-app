class CreateResolutions < ActiveRecord::Migration
  def change
    create_table :resolutions do |t|
      t.integer :width, index:true, null: false
      t.integer :height, index:true, null: false

      t.timestamps null: false
    end

    add_index :resolutions, [:width, :height], :unique => true
  end
end
