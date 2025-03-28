class DropCookbooksTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :cookbooks
  end
end
