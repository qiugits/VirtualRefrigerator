class CreateFoodKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :food_kinds do |t|
      t.string :kindname
      t.integer :nutrition_a

      t.timestamps
    end
  end
end
