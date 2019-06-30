class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :status, default: 'N/A'
      t.integer :quantity, default: 0

      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps null: false
    end
  end
end
