class CreateDeviceLocation < ActiveRecord::Migration
  def change
    create_table :device_locations do |t|
      t.float   :lat,        null: false
      t.float   :lng,        null: false
      t.float   :temperature
      t.integer :battery

      t.timestamps
    end
  end
end
