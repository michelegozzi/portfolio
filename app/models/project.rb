class Project < ActiveRecord::Base
  attr_accessible :description, :name, :url, :sector_id, :resources_attributes

  has_many :resources, :dependent => :destroy

  # undefined method `display_name' for []:ActiveRecord::Relation
  accepts_nested_attributes_for :resources, :allow_destroy => true, :reject_if => :resources_attributes_blank?

  belongs_to :sector

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :url, length: { maximum: 255 }
  validates :sector_id, presence: true

  def create_uuid
    self.uuid = SecureRandom.uuid
  end

  def resources_attributes_blank?(attrs)
    attrs.except('id').values.all?(&:blank?)
  end
end