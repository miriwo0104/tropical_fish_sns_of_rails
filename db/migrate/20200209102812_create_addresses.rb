class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :random_id
      t.string :address

      t.timestamps
    end
  end
end
