class ZipCode < ActiveRecord::Base
  belongs_to :zone
  attr_accessible :city, :name, :state
end
