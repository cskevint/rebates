class Category < ActiveRecord::Base

  attr_accessible :description, :name, :sector

  has_many :parameters, :as => :parameterable

  has_many :sub_categories

  validates :name,  :presence => true

  def find_rebates
    sub_categories.inject([]) {|result, m| result.concat m.find_rebates }
  end

end
