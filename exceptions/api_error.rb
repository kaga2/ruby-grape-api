# frozen_string_literal: true

require_relative 'base_exception'

module Exceptions
  # Raised when the api reports a error response
  class APIError < BaseException
    def initialize(message:, http_status: 500, code: nil, data: nil)
      super(message: message, http_status: http_status, data: data, code: code)
    end
  end
end
