# frozen_string_literal: true

require 'rails_helper'

shared_context 'shared/services/contexts/searches/search_travelers' do
  include_context 'shared/services/contexts/port_and_travelers'

  let!(:route) do
    create(:route, origin_port:, destination_port:)
  end

  let(:departure_date) { Date.today }

  let(:attributes) { { route:, departure_date: } }

  let!(:search) { create(:search, **attributes) }
end
