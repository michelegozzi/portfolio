class Resource < ActiveRecord::Base
  attr_accessible :description, :mime, :url

  belongs_to :project
end
