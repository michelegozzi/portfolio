class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveRecord::Persistence
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Serialization
  extend ActiveModel::Naming
  
  attr_accessor :id, :username, :password, :remember_token
  attr_accessor :authenticated

  attr_accessible :username, :password
  
  validates :username, presence: true, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 8 }
  
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attributes
    {
      'id' => id,
      'username' => username,
      'password' => password,
      'remember_token' => remember_token,
      'authenticated' => authenticated
    }
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def persisted?
    true
  end

  def readonly?
    false
  end

  # class methods
  class << self

    # authenticates the user
    def authenticate(username, password)

      user = User.new
      auth = AuthCfg.new
      user.authenticated |= auth.options[Rails.env]["username"].to_s == username
      user.authenticated &= auth.options[Rails.env]["password"].to_s == password

      if user.authenticated
        update = false
        user.username = username
        user.password = password
        #debugger
        if auth.options[Rails.env]["remember_token"].nil?
          user.create_remember_token unless auth.options[Rails.env]["remember_token"].to_s
          auth.options[Rails.env]["remember_token"] = user.remember_token
          update = true
        else
          user.remember_token = auth.options[Rails.env]["remember_token"].to_s
        end

        if auth.options[Rails.env]["id"].nil?
          auth.options[Rails.env]["id"] = user.id = 0
          update = true
        else
          user.id = auth.options[Rails.env]["id"].to_i
        end

        auth.save unless update
      end

      return user unless !user.authenticated
    end

    # finds the user by his remember token
    def find_by_remember_token(token)
      #debugger
      user = User.new
      auth = AuthCfg.new
      user.authenticated |= auth.options[Rails.env]["remember_token"].to_s == token

      if user.authenticated
        user.username = auth.options[Rails.env]["username"].to_s
        user.password = auth.options[Rails.env]["password"].to_s
        user.id = auth.options[Rails.env]["id"].to_i
        user.remember_token = token
      end

      return user unless !user.authenticated
    end

    # finds the user by id
    def find(id)
      user = User.new
      auth = AuthCfg.new
      user.authenticated |= auth.options[Rails.env]["id"].to_i == id.to_i

      if user.authenticated
        user.username = auth.options[Rails.env]["username"].to_s
        user.password = auth.options[Rails.env]["password"].to_s
        user.id = id.to_i
        user.remember_token = auth.options[Rails.env]["remember_token"]
      end

      return user unless !user.authenticated
    end
  end

  private

end