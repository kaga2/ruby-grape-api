# frozen_string_literal: true

require_relative 'base_exception'

module Exceptions
  # Raised when the api reports a fail response
  class APIFail < BaseException
    def initialize(data:, message: nil, code: nil, http_status: 400)
      super(data: data, http_status: http_status, message: message, code: code)
    end
  end
end
