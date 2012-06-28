class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.references :sub_category

      t.timestamps
    end
    add_index :product_types, :sub_category_id
  end
end
