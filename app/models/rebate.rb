class Rebate < ActiveRecord::Base

  belongs_to :provider
  belongs_to :zone

  belongs_to :rebateable, :polymorphic => true

  attr_accessible :additional_details,
                  :amount,
                  :available_date,
                  :description,
                  :exclusions,
                  :exhausted_flag,
                  :expiration_date,
                  :name,
                  :rebate_url,
                  :rebateable_id,
                  :rebateable_type,
                  :requirements,
                  :units,
                  :provider_id,
                  :zone_id,
                  :code,
                  :replacement

  validates :name,  :presence => true

  def previous
    Rebate.where(["id < ?", id]).last
  end

  def next
    Rebate.where(["id > ?", id]).first
  end

end
