# frozen_string_literal: true

# this should be available for Avo.
# config/intitializers/avo.rb
Avo.configure do |config|
  config.license = 'pro'
  config.license_key = ENV['AVO_LICENSE_KEY']
end
