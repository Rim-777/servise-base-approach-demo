# frozen_string_literal: true

class SearchContract < Dry::Validation::Contract
  traveler_types = Types::String.enum('Traveler::Adult', 'Traveler::Child')

  schema do
    required(:data).hash do
      required(:route_attributes).hash do
        required(:origin_port_code).filled(:string)
        required(:destination_port_code).filled(:string)
      end

      required(:departure_date).filled(:string)

      required(:travelers_attributes).array(:hash) do
        required(:quantity).filled(:integer)
        required(:type).filled(traveler_types)
      end
    end
  end

  rule(%i[data departure_date]) do
    key.failure('has invalid format') unless /\A\d{4}-\d{2}-\d{2}\Z/.match?(value)
  end
end
