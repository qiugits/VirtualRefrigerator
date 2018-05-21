class AddAmountToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :amount, :integer
  end
end
