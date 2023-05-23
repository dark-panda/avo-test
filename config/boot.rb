# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# load File.expand_path('../bin/spring', __dir__) \
#  if !defined?(Spring) && [nil, 'development', 'test'].include?(ENV['RAILS_ENV'])

require 'bundler/setup' # Set up gems listed in the Gemfile.

unless ENV['RAILS_ENV'] == 'test'
  require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
end
