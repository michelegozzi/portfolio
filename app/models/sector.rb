class Sector < ActiveRecord::Base
  attr_accessible :description

  has_many :projects, :dependent => :destroy
end
