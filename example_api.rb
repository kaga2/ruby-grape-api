# frozen_string_literal: true

require 'grape'

require_relative 'exceptions/api_fail'
require_relative 'exceptions/api_error'
require_relative 'services/initialize'
require_relative 'api_versions/v1/api'

# Example Grape API
class ExampleAPI < Grape::API
  prefix :api
  format :json
  content_type :json, 'application/json'

  mount APIVersions::V1::API
end
