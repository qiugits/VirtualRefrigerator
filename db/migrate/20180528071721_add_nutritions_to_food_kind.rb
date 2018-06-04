class AddNutritionsToFoodKind < ActiveRecord::Migration[5.2]
  def change
    add_column :food_kinds, :food_kind, :string
    add_column :food_kinds, :protein, :float
    add_column :food_kinds, :lipd, :float
    add_column :food_kinds, :carbon, :float
    add_column :food_kinds, :vitamin, :float
    add_column :food_kinds, :minerals, :float
  end
end
