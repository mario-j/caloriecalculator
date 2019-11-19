class AddFoodTypeToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :food_type, :string
  end
end
