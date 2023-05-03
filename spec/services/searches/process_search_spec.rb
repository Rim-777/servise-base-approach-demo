# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Searches::ProcessSearch do
  describe '#call' do
    include_context 'shared/services/contexts/searches/process_search'

    let(:attributes) do
      {
        route_attributes: {
          origin_port_code: rio_port_code,
          destination_port_code: morocco_port_code
        },
        departure_date: '2023-11-11',
        travelers_attributes: [
          {
            quantity: 1,
            type: 'Traveler::Adult'
          },
          {
            quantity: 1,
            type: 'Traveler::Child'
          }
        ]
      }
    end

    let(:search_results) do
      [
        {
          origin_port: 'origin_port 1',
          destination_port: 'destination_port 1',
          departure_date: 1_681_399_699,
          traveler_class: 'traveler_class 1',
          price: 88,
          id: '1'
        },
        {
          origin_port: 'origin_port 2',
          destination_port: 'destination_port 2',
          departure_date: 1_681_399_639,
          traveler_class: 'traveler_class 2',
          price: 99,
          id: '2'
        }
      ]
    end

    before do
      allow(JSON).to receive(:parse).and_return(search_results)
    end

    subject { described_class.call(attributes) }

    it 'creates a new search' do
      expect { subject }.to change(Search, :count).from(0).to(1)
    end

    it 'creates a new route' do
      expect { subject }.to change(Route, :count).from(0).to(1)
    end

    it 'creates an expected number of searches travelers' do
      expect { subject }.to change(SearchesTraveler, :count).from(0).to(2)
    end

    it 'creates an expected number of searches travelers' do
      expect { subject }.to change(Search::Result, :count).from(0).to(2)
    end

    context 'route exist' do
      let!(:route) { create(:route, origin_port:, destination_port:) }

      it 'creates does not create routes' do
        expect { subject }.not_to change(Route, :count)
      end

      it 'associates search with an existing route' do
        expect(subject.search.route).to eq(route)
      end
    end
  end
end
