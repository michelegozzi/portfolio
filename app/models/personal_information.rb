class PersonalInformation < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :about

  

  validates :about, presence: true, length: { maximum: 255 }

end
