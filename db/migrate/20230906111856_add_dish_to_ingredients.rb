class AddDishToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :dish, null: false, foreign_key: true
  end
end
