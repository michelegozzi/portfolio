class Dispatch
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveRecord::Persistence
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Serialization
  extend ActiveModel::Naming
  
  attr_accessor :from, :name, :message

  attr_accessible :from, :name, :message
  
  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :from, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { minimum: 8, maximum: 255 }
  
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    {
      'name' => name,
      'from' => from,
      'message' => message
    }
  end

  def persisted?
    false
  end

  def readonly?
    false
  end

end