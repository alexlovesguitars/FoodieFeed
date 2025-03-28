class CreateCookbooks < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:cookbooks)
      create_table :cookbooks do |t|
        t.references :user, null: false, foreign_key: true
        t.references :recipe, null: false, foreign_key: true
        t.text :notes

        t.timestamps
      end
    end
  end
end
