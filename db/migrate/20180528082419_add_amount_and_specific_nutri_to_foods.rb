class AddAmountAndSpecificNutriToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :protein, :float
    add_column :foods, :lipd, :float
    add_column :foods, :carbon, :float
    add_column :foods, :vitamin, :float
    add_column :foods, :minerals, :float
  end
end
