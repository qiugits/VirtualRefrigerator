class AddAmountToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :amount, :float, default: 1
  end
end
