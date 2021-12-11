require_relative 'boot'

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ContactsExample40
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    if ENV["ZIPKIN_ENABLED"].present?
      config.middleware.use ZipkinTracer::RackHandler,
        service_name: "everydayrails-rspec",
        service_port: (ENV["ZIPKIN_SERVICE_PORT"] || 3000).to_i,
        json_api_host: ENV["ZIPKIN_URL"] || "http://localhost:9411",
        sample_rate: 1
    end
  end
end
