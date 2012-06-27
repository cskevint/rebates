class CreateRebates < ActiveRecord::Migration
  def change
    create_table :rebates do |t|
      t.string :name
      t.text :description
      t.string :units
      t.integer :amount
      t.date :available_date
      t.date :expiration_date
      t.boolean :exhausted_flag
      t.text :requirements
      t.text :exclusions
      t.text :additional_details
      t.text :rebate_url
      t.integer :rebateable_id
      t.string :rebateable_type
      t.references :provider
      t.references :zone

      t.timestamps
    end
    add_index :rebates, :provider_id
    add_index :rebates, :zone_id
  end
end
