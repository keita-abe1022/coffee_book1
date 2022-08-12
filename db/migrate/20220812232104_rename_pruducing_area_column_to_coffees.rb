class RenamePruducingAreaColumnToCoffees < ActiveRecord::Migration[6.1]
  def change
    rename_column :coffees, :pruducing_area, :producing_area
  end
end
