# frozen_string_literal: true

module APIVersions
  module V1
    module ResponseDecorators
      # Diffent types of responses
      module RestResponses
        class << self
          # All went well, and (usually) some data was returned.
          def rest_success(data:)
            { status: :success, data: data }
          end

          # There was a problem with the data submitted, or some pre-condition of the API call wasn't satisfied
          def rest_fail(data:)
            { status: :fail, data: data }
          end

          # An error occurred in processing the request, i.e. an exception was thrown
          def rest_error(message:, code: nil, data: nil)
            response = { status: :error, message: message, code: code, data: data }
            response.compact
          end
        end
      end
    end
  end
end
