class AddParamIdToValues < ActiveRecord::Migration
  def change
    change_column :rebates, :amount, :float
    add_column :parameter_values, :parameter_id, :integer
  end
end
