class CreateNutritions < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritions do |t|
      t.string :item
      t.integer :protein
      t.integer :lipd
      t.integer :carbon
      t.integer :vitamin
      t.integer :minerals

      t.timestamps
    end
  end
end
