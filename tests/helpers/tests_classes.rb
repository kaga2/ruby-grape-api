# frozen_string_literal: true

require 'simplecov'
require 'minitest/autorun'
require 'mocha/minitest'
require 'minitest/unit'
require 'webmock/minitest'
require 'colorize'
require 'minitest/reporters'
require 'rack/test'
require 'awesome_print'

SimpleCov.start
SimpleCov.minimum_coverage(100)
require './example_api'

Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

module Tests
  module Helpers
    # Class with methods to test
    class Test < Minitest::Test
      def run(*args, &block)
        Sequel.transaction([database], rollback: :always) do
          super
        end
      end

      def database
        Services[:database]
      end
    end

    # Class with methods to test endpoints
    class TestResource < Test
      include Rack::Test::Methods

      def app
        ExampleAPI
      end
    end
  end
end
