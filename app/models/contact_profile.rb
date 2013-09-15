class ContactProfile < ActiveRecord::Base
  attr_accessible :name, :icon_name, :icon_class, :profile_type, :value, :priority

  TYPES = { :undefined => 0, :email => 1, :url => 2 }
end
