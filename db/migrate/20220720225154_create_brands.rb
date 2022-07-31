class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name, unique: true
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
