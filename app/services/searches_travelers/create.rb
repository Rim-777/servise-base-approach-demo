# frozen_string_literal: true

module SearchesTravelers
  class Create
    prepend BaseOperation

    param :attributes, type: Types::Strict::Hash | Types::Array.of(Types::Strict::Hash)

    attr_reader :result

    def call
      @result = SearchesTraveler.create!(attributes)
    rescue ActiveRecord::RecordInvalid => e
      fail!([e.message])
    end
  end
end
