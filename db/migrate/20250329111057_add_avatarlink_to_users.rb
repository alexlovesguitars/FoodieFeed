class AddAvatarlinkToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar_link, :string
  end
end
