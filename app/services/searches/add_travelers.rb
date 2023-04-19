# frozen_string_literal: true

module Searches
  class AddTravelers
    prepend BaseOperation

    option :search, type: Types.Instance(Search)
    option :travelers_attributes,
           type: Types::Array.of(
             Types::Strict::Hash.schema(
               type: Types::String.enum('Traveler::Adult', 'Traveler::Child'),
               quantity: Types::NumericString | Types::Strict::Integer
             )
           )

    def call
      operation = SearchesTravelers::Create.call(searches_travelers_attributes)
      fail!(operation.errors) if operation.failure?
    end

    private

    def searches_travelers_attributes
      @travelers_attributes.each_with_object([]) do |attribute_hash, result|
        attribute_hash.fetch(:quantity).times do
          traveler = Traveler.find_by!(type:  attribute_hash.fetch(:type))

          result << { traveler:, search: @search }
          result
        end
      end
    end
  end
end
