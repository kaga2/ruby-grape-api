# frozen_string_literal: true

require './exceptions/api_fail'
require './exceptions/api_error'
require_relative 'rest_responses'

module APIVersions
  module V1
    module ResponseDecorators
      # https://github.com/omniti-labs/jsend
      module JSend
        class << self
          def included(base)
            configure_api_fail_exception(base)
            configure_api_error_exception(base)
            configure_uncaught_exceptions(base)
            configure_api_success_responses(base)
          end

          def configure_api_success_responses(base)
            base.formatter(:json, ->(response, _env) { RestResponses.rest_success(data: response).to_json })
          end

          def configure_api_fail_exception(base)
            base.rescue_from(Exceptions::APIFail) do |ex|
              response = RestResponses.rest_fail(data: ex.data)
              error!(response, ex.http_status, env['api.endpoint'].header)
            end
          end

          def configure_api_error_exception(base)
            base.rescue_from(Exceptions::APIError) do |ex|
              response = RestResponses.rest_error(message: ex.message, code: ex.code, data: ex.data)
              error!(response, ex.http_status, env['api.endpoint'].header)
            end
          end

          def configure_uncaught_exceptions(base)
            base.rescue_from(Exception) do |ex|
              response = RestResponses.rest_error(message: ex.message)
              error!(response, 500, env['api.endpoint'].header)
            end
          end
        end
      end
    end
  end
end
