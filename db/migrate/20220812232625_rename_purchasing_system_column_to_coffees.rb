class RenamePurchasingSystemColumnToCoffees < ActiveRecord::Migration[6.1]
  def change
    rename_column :coffees, :purchasing_system, :purchashing_system
  end
end
