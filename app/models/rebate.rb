class Rebate < ActiveRecord::Base
  belongs_to :provider
  belongs_to :zone
  attr_accessible :additional_details, :amount, :available_date, :description,
                  :exclusions, :exhausted_flag, :expiration_date, :name, :rebate_url,
                  :rebateable_id, :rebateable_type, :requirements, :units, :provider_id, :zone_id
end
