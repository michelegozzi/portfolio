class Sector < ActiveRecord::Base
  attr_accessible :description, :icon_name, :icon_class

  has_many :projects, :dependent => :destroy
end
