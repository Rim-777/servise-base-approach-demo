# frozen_string_literal: true

require 'rails_helper'

shared_context 'shared/contexts/searches/process_search' do
  let(:rio_port_code) { 'rdj' }
  let(:morocco_port_code) { 'mrc' }
  let!(:origin_port) { create(:port, name: 'Rio de Janeiro', code: rio_port_code) }
  let!(:destination_port) { create(:port, name: 'Morocco', code: morocco_port_code) }
  let!(:adult_traveler) { create(:traveler, type: 'Traveler::Adult') }
  let!(:child_traveler) { create(:traveler, type: 'Traveler::Child') }
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
