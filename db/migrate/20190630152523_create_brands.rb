class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false

      t.references :category, foreign_key: true

      t.timestamps null: false
    end
  end
end
