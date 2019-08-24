require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Circle
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'

	config.i18n.default_locale = :ja
  end
end



# config.middleware.insert_before 0, "Rack::Cors" do
#   allow do
#     origins '*'
#     resource '*',
#       :headers => 'Content-*',
#       :methods => [:get],
#       :max_age => 0
#   end
# end