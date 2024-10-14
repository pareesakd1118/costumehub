class CreateCostumes < ActiveRecord::Migration[7.2]
  def change
    create_table :costumes do |t|
      t.string :name
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
