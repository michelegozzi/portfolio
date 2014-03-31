class Project < ActiveRecord::Base
  attr_accessible :description, :name, :url, :sector_id, :resources_attributes, :uuid

  has_many :resources, :dependent => :destroy

  # undefined method `display_name' for []:ActiveRecord::Relation
  accepts_nested_attributes_for :resources, :allow_destroy => true, :reject_if => :resources_attributes_blank?

  belongs_to :sector

  DESCRIPTION_MAXIMUM_LENGTH = 255
  URL_MAXIMUM_LENGTH = 255

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: DESCRIPTION_MAXIMUM_LENGTH }
  validates :url, length: { maximum: URL_MAXIMUM_LENGTH }
  validates :sector_id, presence: true

  def create_uuid
    if self.uuid.nil?
      self.uuid = SecureRandom.uuid
    end
  end

  def resources_attributes_blank?(attrs)
    attrs.except('id').values.all?(&:blank?)
  end
end