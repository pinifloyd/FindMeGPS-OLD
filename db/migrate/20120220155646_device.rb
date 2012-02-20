class Device < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :number, null: false
      t.string  :name
    end
  end
end
