require_relative 'boot'

require 'rails/all'

require "sidekiq/web"

Bundler.require(*Rails.groups)

module BeerMe
  class Application < Rails::Application
    config.load_defaults 5.1

    config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }

    config.active_job.queue_adapter = :sidekiq
  end
end
