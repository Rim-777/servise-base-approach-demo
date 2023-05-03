# frozen_string_literal: true

module Api
  module V1
    class SearchesController < BaseController
      before_action :validate_params, only: :process_search

      def process_search
        operation = Searches::ProcessSearch.call(**@valid_params.fetch(:data))

        if operation.success?
          serializer = SearchSerializer.new(
            operation.search,
            include: %w[
              travelers
              route
              route.origin_port
              route.destination_port
            ]
          )
          render json: serializer.serializable_hash.to_json, status: :created
        else
          error_response(operation.errors, :unprocessable_entity)
        end
      end

      private

      def validate_params
        validation = SearchContract.new.call(search_params)
        result_validation(validation)
      end

      def search_params
        params.permit(data: {}).to_h
      end
    end
  end
end
