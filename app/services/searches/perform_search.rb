# frozen_string_literal: true

module Searches
  class PerformSearch
    prepend BaseOperation

    option :search, type: Types.Instance(Search)

    attr_reader :search_results

    def call
      provider = Provider.find_by(code: 'fj_provired')
      end_point = Provider::EndPoint.find_by(provider:, code: 'search-book')
      @response = connection(end_point.url).get('')
      @response_body = JSON.parse(@response.body)

      @search_results = Search::Result.create!(results_attributes)
    end

    private

    def connection(url)
      Faraday.new(url:, headers: { 'Content-Type' => 'application/json' })
    end

    def results_attributes
      @response_body.each_with_object([]) do |attribute_hash, attributes_collection|
        attributes_collection << attribute_hash.merge(search: @search)
        attributes_collection
      end
    end
  end
end
