# frozen_string_literal: true

require './tests/helpers/tests_classes'

module Tests
  module APIVersions
    module V1
      module Resources
        # Class to test all the Example resource
        class TestExample < Tests::Helpers::TestResource
          def test_example_resource_without_param
            get '/api/v1/example'

            expected_response = {
              status: 'error',
              message: 'example_param is missing, example_param is empty'
            }.to_json
            assert_equal expected_response, last_response.body
          end

          def test_example_resource
            get '/api/v1/example?example_param=1234'

            expected_response = {
              status: 'success',
              data: { result: 'Example response: example_param = 1234' }
            }.to_json
            assert_equal expected_response, last_response.body
          end

          def test_response_with_fail_exception
            exception = Exceptions::APIFail.new(data: { errors: ['some error message', 'another error message'] })
            Business::Example.any_instance.expects(:do_something).raises(exception)
            get '/api/v1/example?example_param=1234'

            expected_response = {
              status: 'fail',
              data: { errors: ['some error message', 'another error message'] }
            }.to_json
            assert_equal expected_response, last_response.body
          end

          def test_response_with_error_exception
            exception = Exceptions::APIError.new(message: 'something was wrong')
            Business::Example.any_instance.expects(:do_something).raises(exception)
            get '/api/v1/example?example_param=1234'

            expected_response = {
              status: 'error',
              message: 'something was wrong'
            }.to_json
            assert_equal expected_response, last_response.body
          end
        end
      end
    end
  end
end
