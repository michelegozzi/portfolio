# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Portfolio::Application.initialize!

Rails.logger = Logger.new(STDOUT)
#Rails.logger = Log4r::Logger.new("Application Log")
Rails.logger.level = 0 # at any time