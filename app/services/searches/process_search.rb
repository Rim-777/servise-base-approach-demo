# frozen_string_literal: true

module Searches
  class ProcessSearch
    prepend BaseOperation

    param :params, type: Types::Strict::Hash

    attr_reader :search

    def call
      ActiveRecord::Base.transaction do
        set_route!
        create_search
        add_travelers
      end

      perform_search
    end

    private

    def set_route!
      attributes = @params.fetch(:route_attributes)
      operation = Routes::FindOrCreate.call(**attributes)

      interrupt_with_errors!(operation.errors) if operation.failure?

      @route = operation.route
    end

    def create_search
      departure_date = @params.fetch(:departure_date).to_date
      operation = Create.call(route: @route, departure_date:)
      interrupt_with_errors!(operation.errors) if operation.failure?

      @search = operation.search
    end

    def add_travelers
      travelers_attributes = @params.fetch(:travelers_attributes)
      operation = AddTravelers.call(travelers_attributes:, search: @search)
      interrupt_with_errors!(operation.errors) if operation.failure?
    end

    def perform_search
      operation = PerformSearch.call(search: @search)

      fail!(operation.errors) if operation.failure?
    end
  end
end
