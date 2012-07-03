class Tagging < ActiveRecord::Base
  attr_accessible :rebate_id, :tag_id

  belongs_to :rebate
  belongs_to :tag
end
