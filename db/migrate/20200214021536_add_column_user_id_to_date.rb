class AddColumnUserIdToDate < ActiveRecord::Migration[6.0]
  def change
    add_column :data, :user_id, :string
  end
end
