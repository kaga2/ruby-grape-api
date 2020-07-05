# frozen_string_literal: true

module APIVersions
  module V1
    module Routes
      # Example resource
      class Example < Grape::API
        resource :example do
          params do
            requires :example_param, type: String, allow_blank: false, desc: 'Example param'
          end
          get do
            { result: "Example response: example_param = #{params[:example_param]}" }
          end
        end
      end
    end
  end
end
