class RenameDeviceLoationColumns < ActiveRecord::Migration
  def up
    change_table :device_locations do |t|
      t.rename :lat, :latitude
      t.rename :lng, :longitude
      t.rename :temperature, :horizontal_accuracy
    end

    remove_column :device_locations, :updated_at
    remove_column :device_locations, :battery

    add_column :device_locations, :speed, :float
  end

  def down
    change_table :device_locations do |t|
      t.rename :latitude, :lat
      t.rename :longitude, :lng
      t.rename :horizontal_accuracy, :temperature
    end

    add_column :device_locations, :updated_at, :datetime
    add_column :device_locations, :battery, :integer

    remove_column :device_locations, :speed
  end
end
