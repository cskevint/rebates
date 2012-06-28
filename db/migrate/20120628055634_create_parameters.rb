class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :name
      t.text :description
      t.integer :parameterable_id
      t.string :parameterable_type

      t.timestamps
    end
  end
end
