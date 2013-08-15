class Project < ActiveRecord::Base
  attr_accessible :description, :name, :url

  has_many :resources, :dependent => :destroy

  belongs_to :sector
end
