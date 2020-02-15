class AddColumnFishTankNumberToDatum < ActiveRecord::Migration[6.0]
  def change
    add_column :data, :fish_tank_number, :string
  end
end
