# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Searches::AddTravelers do
  describe '#call' do
    include_context 'shared/services/contexts/searches/search_travelers'

    let(:options) do
      {
        search:,
        travelers_attributes: [
          {
            type: 'Traveler::Adult',
            quantity: 2
          },
          {
            type: 'Traveler::Child',
            quantity: 2
          }
        ]
      }
    end

    subject { described_class.call(**options) }

    context 'success' do
      include_examples 'shared/services/examples/success'

      it 'creates searches travelers' do
        expect { subject }.to change(SearchesTraveler, :count).from(0).to(4)
      end

      it 'connects adult travelers to search' do
        adult_travelers = search.travelers.where(type: 'Traveler::Adult')

        expect { subject }.to change(adult_travelers, :count).from(0).to(2)
      end

      it 'connects child travelers to search' do
        child_travelers = search.travelers.where(type: 'Traveler::Child')

        expect { subject }.to change(child_travelers, :count).from(0).to(2)
      end
    end
  end
end
