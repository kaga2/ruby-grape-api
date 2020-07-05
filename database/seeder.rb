# frozen_string_literal: true

require 'sequel'
require 'sequel/extensions/seed'

require './services/initialize'

# Class to execute database seeds
class Seeder
  SEEDS_PATH = './database/seeds'

  class << self
    def run_seeds!(environment)
      raise 'Missing environment' if environment.nil?

      Sequel.extension :seed
      Sequel::Seed.setup(environment)
      Sequel::Seeder.apply(Services[:database], SEEDS_PATH)
    end
  end
end
