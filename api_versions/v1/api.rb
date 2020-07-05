# frozen_string_literal: true

require_relative 'resources/example'
require_relative 'response_decorators/jsend'

module APIVersions
  module V1
    # Example API v1
    class API < Grape::API
      version :v1
      include ResponseDecorators::JSend

      mount Routes::Example
    end
  end
end
