class Provider < ActiveRecord::Base
  attr_accessible :name, :ptype

  has_many :rebates

  validates :name,  :presence => true
end
