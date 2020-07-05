# frozen_string_literal: true

module Exceptions
  # Basic exception
  class BaseException < StandardError
    attr_reader :message, :code, :data, :http_status

    def initialize(data: nil, message: nil, code: nil, http_status:)
      @code = code
      @message = message
      @data = data
      @http_status = http_status
    end
  end
end
