class RenameTypeToCategoryInCostumes < ActiveRecord::Migration[7.2]
  def change
    rename_column :costumes, :type, :category
  end
end
