class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :excluded_ingredients

      t.timestamps
    end
  end
end
