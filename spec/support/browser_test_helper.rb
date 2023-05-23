# frozen_string_literal: true

module BrowserTestHelper
  extend ActiveSupport::Concern

  included do
    before do
      Rails.application.env_config['action_dispatch.show_exceptions'] = true

      Capybara.current_driver = Capybara.javascript_driver = :cuprite
      Capybara.raise_server_errors = false

      WebMock.disable_net_connect!(allow_localhost: true)
    end

    after do
      Rails.application.env_config['action_dispatch.show_exceptions'] = false

      Capybara.reset_sessions!
      Capybara.use_default_driver
      Capybara.raise_server_errors = true

      WebMock.disable_net_connect!
    end
  end
end
