# frozen_string_literal: true

module Routes
  class FindOrCreate
    prepend BaseOperation

    option :origin_port_code, type: Types::Strict::String
    option :destination_port_code, type: Types::Strict::String

    attr_reader :route

    def call
      origin_port = Port.find_by!(code: @origin_port_code)
      destination_port = Port.find_by!(code: @destination_port_code)

      @route = process_route!(origin_port, destination_port)
    rescue ActiveRecord::RecordInvalid => e
      fail!(e.message)
    end

    private

    def process_route!(origin_port, destination_port)
      Route.transaction do
        ActiveRecord::Base.connection.execute(<<~SQL).clear
          lock routes in share row exclusive mode;
        SQL

        Route.find_or_create_by!(origin_port:, destination_port:)
      end
    end
  end
end
