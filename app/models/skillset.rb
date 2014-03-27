class Skillset < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :skills_attributes

  has_many :skills, :dependent => :destroy

  accepts_nested_attributes_for :skills, :allow_destroy => true, :reject_if => :skills_attributes_blank?

  validates :name, presence: true, length: { maximum: 50 }

  def skills_attributes_blank?(attrs)
    attrs.except('id').values.all?(&:blank?)
  end
end
