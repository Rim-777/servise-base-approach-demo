# frozen_string_literal: true

module Searches
  class Create
    prepend BaseOperation

    option :departure_date, type: Types::Strict::Date
    option :route, type: Types.Instance(Route)

    attr_reader :search

    def call
      @search = Search.create!(departure_date: @departure_date, route: @route)
    rescue ActiveRecord::RecordInvalid => e
      fail!([e.message])
    end
  end
end
