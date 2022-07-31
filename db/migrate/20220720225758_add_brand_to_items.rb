class AddBrandToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :brand_id, :bigint
  end
end
