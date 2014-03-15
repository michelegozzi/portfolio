class ContactProfile < ActiveRecord::Base
  attr_accessible :name, :icon_name, :icon_class, :profile_type, :value, :priority

  TYPES = { :undefined => 0, :email => 1, :url => 2, :twitter => 3 }

  validates :name, presence: true, length: { maximum: 50 }
  validates :value, presence: true, length: { maximum: 255 }

  

  scope :by_profile_type, ->(profile_type) { where("profile_type = ?", profile_type) }

  #ContactProfile.by_profile_type(ContactProfile::TYPES[:twitter])
  #ContactProfile.where(profile_type: ContactProfile::TYPES[:twitter]).pluck(:value)
end