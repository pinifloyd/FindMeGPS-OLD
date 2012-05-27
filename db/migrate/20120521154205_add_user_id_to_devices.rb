class AddUserIdToDevices < ActiveRecord::Migration

  def up
    add_column    :devices, :user_id, :integer
    change_column :devices, :number, :string
  end

  def down
    remove_column :devices, :user_id
    change_column :devices, :number, :integer
  end

end
