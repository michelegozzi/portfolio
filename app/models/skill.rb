class Skill < ActiveRecord::Base
  attr_accessible :name

  belongs_to :skillset

  validates :name, presence: true, length: { maximum: 50 }
end
