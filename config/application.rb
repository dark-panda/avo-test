# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestingApp
  class Application < Rails::Application
    config.load_defaults '7.0'
    config.time_zone = 'Eastern Time (US & Canada)'
    config.beginning_of_week = :sunday
    config.autoloader = :zeitwerk

    config.action_controller.include_all_helpers = false
    config.active_record.schema_format = :sql
    config.active_record.dump_schema_after_migration = false
    config.active_record.async_query_executor = :global_thread_pool
    config.active_storage.service_urls_expire_in = 30.seconds
    config.active_support.remove_deprecated_time_with_zone_name = true
    config.active_support.test_order = :random
    config.active_model.i18n_customize_full_message = true
    config.action_dispatch.rescue_responses['Pundit::NotAuthorizedError'] = :forbidden
  end
end
