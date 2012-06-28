class CreateParameterValues < ActiveRecord::Migration
  def change
    create_table :parameter_values do |t|
      t.string :value
      t.integer :valueable_id
      t.string :valueable_type

      t.timestamps
    end
  end
end
