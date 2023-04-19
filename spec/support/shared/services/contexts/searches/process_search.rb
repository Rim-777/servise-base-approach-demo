# frozen_string_literal: true

require 'rails_helper'

shared_context 'shared/services/contexts/searches/process_search' do
  include_context 'shared/services/contexts/port_and_travelers'

  let!(:provider) { create(:provider, name: 'Fancy Journey', code: 'fj_provired') }

  let!(:provider_end_point) do
    create(
      :provider_end_point,
      provider:,
      name: 'Search Book',
      code: 'search-book',
      url: 'https://6435508c83a30bc9ad5d5be7.mockapi.io/v1/solution',
      description: 'returns a list of journeys'
    )
  end
end
