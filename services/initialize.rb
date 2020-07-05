# frozen_string_literal: true

require 'dry-container'
require 'config'
require 'sequel'

# Maintains the services in memory or creates them accordingly
class Services
  extend Dry::Container::Mixin

  Config.setup do |config|
    config.use_env = true
    config.env_prefix = 'SETTINGS'
    config.env_separator = '_'
    config.load_and_set_settings('./config/settings.yml')
  end

  register :database, memoize: true do
    Sequel.connect(Settings[:database][:endpoint])
  end
end
