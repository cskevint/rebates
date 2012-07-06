class AddSectorToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sector, :string
  end
end
