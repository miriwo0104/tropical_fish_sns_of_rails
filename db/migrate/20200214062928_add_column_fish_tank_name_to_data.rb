class AddColumnFishTankNameToData < ActiveRecord::Migration[6.0]
  def change
    add_column :data, :fish_tank_name, :string
  end
end
