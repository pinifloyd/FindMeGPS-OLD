class AddDeviceIdToDeviceLocation < ActiveRecord::Migration
  def change
    add_column :device_locations, :device_id, :integer, null: false
  end
end
