class ZipCode < ActiveRecord::Base
  belongs_to :zone

  has_many :rebates, :through => :zone

  attr_accessible :city, :name, :state, :zone_id

  validates :name,  :presence => true
end
