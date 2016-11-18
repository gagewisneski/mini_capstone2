class ChangeActiveToStock < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :active, :stock
  end
end
