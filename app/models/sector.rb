class Sector < ActiveRecord::Base
  attr_accessible :description, :icon_name, :icon_class

  has_many :projects, :dependent => :destroy

  validates :description, presence: true, length: { maximum: 50 }
end