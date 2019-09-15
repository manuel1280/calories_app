class AddNumRegistersToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :num_register, :integer
  end
end
