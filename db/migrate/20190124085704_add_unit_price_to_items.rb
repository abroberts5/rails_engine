class AddUnitPriceToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :unit_price, :decimal
  end
end
