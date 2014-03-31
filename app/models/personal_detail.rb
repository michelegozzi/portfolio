class PersonalDetail < ActiveRecord::Base
  attr_accessible :about

  ABOUT_MAXIMUM_LENGTH = 255

  validates :about, presence: true, length: { maximum: ABOUT_MAXIMUM_LENGTH }
end
