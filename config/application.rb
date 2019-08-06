require_relative 'boot'

require 'rails/all'
require 'rack/rewrite'


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


if ENV['RACK_ENV'] == 'production'
  config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://www.circle-book.com$&', :if => Proc.new { |rack_env|
      rack_env['SERVER_NAME'] != 'circle-book.com'
    }
  end
end
