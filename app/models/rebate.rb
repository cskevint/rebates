class Rebate < ActiveRecord::Base

  belongs_to :provider
  belongs_to :zone

  belongs_to :rebateable, :polymorphic => true

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  attr_writer :tag_names
  after_save :assign_tags

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
                  :replacement,
                  :tag_names

  validates :name,  :presence => true

  def previous
    Rebate.where(["id < ?", id]).last
  end

  def next
    Rebate.where(["id > ?", id]).first
  end

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  def sector_names
    @names = []
    [1, 2].each do |i|
      if tag_ids.include? i
        @names.push Tag.find(i).name
      end
    end
    @names
  end

  def industry_names
    @names = []
    (3..20).each do |i|
      if tag_ids.include? i
        @names.push Tag.find(i).name
      end
    end
    @names
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/,/).map do |name|
        Tag.find_or_create_by_name(name.strip)
      end
    end
  end

end
