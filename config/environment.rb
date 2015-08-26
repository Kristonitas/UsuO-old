# Load the Rails application.
require File.expand_path('../application', __FILE__)

Rails.application.config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/

# Initialize the Rails application.
Rails.application.initialize!
