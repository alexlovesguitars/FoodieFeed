class AddInstagramToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :instagram, :string
  end
end
