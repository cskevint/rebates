class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.string :name
      t.string :city
      t.string :state
      t.references :zone

      t.timestamps
    end
    add_index :zip_codes, :zone_id
  end
end
