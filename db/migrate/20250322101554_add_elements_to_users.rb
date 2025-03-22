class AddElementsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :bio, :text
    add_column :users, :social, :string
    add_column :users, :creator, :boolean
  end
end
