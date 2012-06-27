class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category
      t.references :sub_category
      t.references :product_type

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :sub_category_id
    add_index :products, :product_type_id
  end
end
