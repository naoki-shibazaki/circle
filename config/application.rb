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

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

    amp_css_paths = Dir.entries("#{config.root}/app/assets/stylesheets/amp").select { |name| name =~ /css$/ }.map { |name| "amp/#{name}" }
    config.assets.precompile += amp_css_paths

    config.active_storage.variable_content_types += ['image/heic', 'image/heic-sequence', 'image/heif', 'image/heif-sequence']

    config.active_record.use_yaml_unsafe_load = true

  end
end