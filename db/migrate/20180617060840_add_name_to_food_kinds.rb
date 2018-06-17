class AddNameToFoodKinds < ActiveRecord::Migration[5.2]
  def change
    add_column :food_kinds, :name, :string
  end
end
