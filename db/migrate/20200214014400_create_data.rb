class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.string :fish_tank_size
      t.string :filter
      t.string :light
      t.string :water_change
      t.string :number_of_fish
      t.string :co2
      t.string :memo

      t.timestamps
    end
  end
end
