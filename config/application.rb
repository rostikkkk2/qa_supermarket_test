require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QaSupermarketTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.action_dispatch.default_headers = { 'X-Frame-Options' => 'ALLOWALL', 'Access-Control-Allow-Origin' => '*' }
    # config.action_dispatch.default_headers = { 'X-Frame-Options' => 'ALLOW-FROM https://trackersync.stage-a.space' }
    Rails.application.config.hosts << "https://trackersync.stage-a.space/"
    Rails.application.config.hosts << "https://trackersync.stage-a.space"
    Rails.application.config.hosts << "trackersync.stage-a.space"
    # Rails.application.config.hosts << "product.com"
    # config.hosts << "http"
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths += ["#{config.root}/lib"]
    # Be sure that the lib files are eager loaded on production
    config.eager_load_paths += ["#{config.root}/lib"]
  end
end
