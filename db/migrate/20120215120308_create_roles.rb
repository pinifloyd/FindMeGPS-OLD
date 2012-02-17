class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string  :name
      t.boolean :active, default: true
    end
  end
end
