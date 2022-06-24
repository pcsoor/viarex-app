class AddActiveToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :active, :boolean
  end
end
