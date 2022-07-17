class AddRole < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.boolean :admin
      t.boolean :employee
      t.bigint :user_id

      t.timestamps
    end
  end
end
