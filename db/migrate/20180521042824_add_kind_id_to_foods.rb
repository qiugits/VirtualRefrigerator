class AddKindIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :kind_id, :integer
  end
end
