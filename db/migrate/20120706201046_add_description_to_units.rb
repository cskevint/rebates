class AddDescriptionToUnits < ActiveRecord::Migration
  def change
    add_column :units, :description, :string
  end
end
