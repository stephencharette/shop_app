class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price, precision: 8, scale: 2
      t.boolean :active, default: true
      t.integer :condition
      t.string :description
      t.timestamps
    end
  end
end
